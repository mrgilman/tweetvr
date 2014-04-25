class TweetImporter
  def initialize(recording)
    @recording = recording
    @user = recording.user
  end

  def import
    client.userstream do |status, client|
      client.stop if status.created_at > recording.end_at
      Tweet.create(
        recording: recording,
        text: status.text,
        username: status.user.username,
        created_at: status.created_at
      )
    end
  end

  private

  attr_reader :recording, :user

  def client
    @client ||= TweetStream::Client.new(
      consumer_key: ENV['TWITTER_API_KEY'],
      consumer_secret: ENV['TWITTER_API_SECRET'],
      oauth_token: user.token,
      oauth_token_secret: user.secret
    )
  end
end
