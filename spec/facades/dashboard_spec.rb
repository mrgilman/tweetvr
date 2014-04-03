require 'spec_helper'

describe Dashboard do
  describe '#recordings' do
    it 'returns user recordings' do
      user = create(:user, number_of_recordings: 2)

      recordings = Dashboard.new(user).recordings

      expect(recordings).to match_array user.recordings
    end
  end

  describe '#new_recording' do
    it 'returns a new recording' do
      user = create(:user)

      new_recording = Dashboard.new(user).new_recording

      expect(new_recording).to be_a Recording
    end
  end
end
