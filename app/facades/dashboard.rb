class Dashboard
  def initialize(user)
    @user = user
  end

  def recordings
    user.recordings
  end

  def new_recording
    @recording ||= Recording.new
  end

  private

  attr_reader :user
end
