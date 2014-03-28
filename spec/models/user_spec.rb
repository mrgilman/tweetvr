require 'spec_helper'

describe User do
  it { should validate_presence_of :uid }
  it { should validate_presence_of :username }
  it { should validate_presence_of :token }
  it { should validate_presence_of :secret }

  it 'validates uniqueness of uid' do
    existing = create(:user)
    user = User.new

    expect(user).not_to allow_value(existing.uid).for(:uid)
  end

  describe '.find_or_create_from_omniauth' do
    it 'creates a new user from omniauth params if none exists with returned uid' do
      expect { User.find_or_create_from_omniauth(omniauth_params) }.to change(User, :count).by(1)
    end

    it 'sets a remember token' do
      allow(SecureRandom).to receive(:hex).and_return('remember_token')
      user = create(:user)

      expect(user.remember_token).to eq('remember_token')
    end

    it 'sets a unique remember token' do
      allow(SecureRandom).to receive(:hex).and_return('used_token', 'used_token', 'remember_token')
      create(:user)
      user = create(:user)

      expect(user.remember_token).to eq('remember_token')
    end

    it 'does not create a new user if user with returned uid exists' do
      create(:user, uid: '12345')

      expect { User.find_or_create_from_omniauth(omniauth_params) }.not_to change(User, :count)
    end

    it 'returns the existing user if user with returned uid exists' do
      existing = create(:user, uid: '12345')

      user = User.find_or_create_from_omniauth(omniauth_params)

      expect(user).to eq existing
    end
  end

  def omniauth_params
    {
      'uid' => '12345',
      'info' => {
        'nickname' => 'TweetVR_',
      },
      'credentials' => {
        'token' => 'abc123',
        'secret' => 'xyz890'
      }
    }
  end
end
