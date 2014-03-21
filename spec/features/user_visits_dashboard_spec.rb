require 'spec_helper'

feature 'User visits dashboard' do
  scenario 'guest is redirected to homepage' do
    visit dashboard_path

    expect(current_path).to eq root_path
  end

  scenario 'logged in user is not redirected' do
    user = create(:user)
    sign_in(user)
    visit dashboard_path

    expect(current_path).to eq dashboard_path
  end

  def sign_in(user)
    visit root_path
    click_on 'Sign in with Twitter'
  end
end
