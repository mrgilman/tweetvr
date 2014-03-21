require 'spec_helper'

feature 'Guest signs in' do
  scenario 'using Twitter OAuth' do
    visit new_session_path
    click_on 'Sign in with Twitter'

    expect(page).to have_content 'Successfully authenticated'
    expect(User.count).to eq 1
  end
end
