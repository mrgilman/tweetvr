require 'spec_helper'

describe Dashboard do
  describe '#recordings' do
    it 'returns user recordings' do
      user = create(:user, number_of_recordings: 2)

      recordings = Dashboard.new(user).recordings

      expect(recordings).to match_array user.recordings
    end
  end
end
