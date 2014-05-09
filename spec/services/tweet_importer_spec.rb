require 'spec_helper'

describe TweetImporter do
  context '#import' do
    it 'imports tweets from a given recording' do
      recording = create(:recording)
      client = client_stub
      stub_tweetstream_for(recording, client)

      TweetImporter.new(recording).import

      expect(TweetStream::Client).to have_received(:new)
      expect(client).not_to have_received(:stop)
      expect(recording.tweets.count).to eq 1
    end

    it 'stops recording when the current time is later than recording end_at' do
      recording = create(:recording, end_at: 1.minute.ago)
      client = client_stub
      stub_tweetstream_for(recording, client, tweet(2.minutes.ago))

      TweetImporter.new(recording).import

      expect(client).to have_received(:stop)
    end
  end

  def stub_tweetstream_for(recording, client, tweet = tweet)
    TweetStream::Client.stub(:new).
      with(hash_including(
        oauth_token: recording.user.token,
        oauth_token_secret: recording.user.secret
      )).
      and_return(client)
  end

  def client_stub
    client = double('client', stop: true)
    client.stub(:userstream).and_yield(tweet, client)
    client
  end

  def tweet(created_at = Time.current)
    double(
      'Tweet',
      text: 'text of a tweet',
      user: double(username: 'tweetvr_'),
      created_at: created_at
    )
  end
end
