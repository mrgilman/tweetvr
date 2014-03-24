require 'spec_helper'

feature 'User visits dashboard' do
  scenario 'guest is redirected to homepage' do
    visit dashboard_path

    expect(current_path).to eq root_path
  end

  scenario 'logged in user is not redirected' do
    user = create(:user)
    visit dashboard_path(as: user)

    expect(current_path).to eq dashboard_path
  end
end
