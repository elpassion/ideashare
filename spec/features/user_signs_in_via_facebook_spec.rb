require_relative '../rails_helper'

RSpec.feature 'Sign via Facebook', type: :feature do
  context 'valid omniauth' do
    before do
      set_omniauth
      visit 'users/sign_up'
      click_link_or_button 'Sign in with Facebook'
    end

    scenario 'with successful auth' do
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'foobar@example.com'
    end
  end

  context 'invalid omniauth' do
    before do
      set_invalid_omniauth
      visit 'users/sign_up'
      click_link_or_button 'Sign in with Facebook'
    end

    scenario 'with failed auth' do
      expect(page.status_code).to eq(200)
      expect(page).to_not have_content 'foobar@example.com'
    end
  end
end
