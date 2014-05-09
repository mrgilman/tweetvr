require 'spec_helper'

describe Recording do
  it { should have_many(:tweets) }

  it 'validates that a user does not have overlapping recordings' do
    user = create(:user)
    _existing_recording = create(
      :recording,
      user: user,
      start_at: Chronic.parse('tomorrow at 7pm'),
      end_at: Chronic.parse('tomorrow at 9pm')
    )

    recording = Recording.new(
      start_at: Chronic.parse('tomorrow at 8pm'),
      end_at: Chronic.parse('tomorrow at 10pm'),
      user: user
    )

    expect(recording).to be_invalid
  end
end
