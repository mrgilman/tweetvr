require 'spec_helper'

describe SessionsController do
  describe 'POST :create' do
    it 'sets the current user' do
      user = create(:user)
      allow(User).to receive(:find_or_create_from_omniauth).and_return(user)

      post :create

      expect(controller.current_user).to eq user
    end
  end
end
