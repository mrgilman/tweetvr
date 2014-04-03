class Dashboard
  def initialize(user)
    @user = user
  end

  def recordings
    user.recordings
  end

  private

  attr_reader :user
end
