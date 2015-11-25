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
      expect(page.current_path).to eq(desks_path)
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
      expect(page).to_not have_content('Successfully authenticated from Facebook account.')
      expect(page).to have_content('No email, registration faild')
      expect(page.current_path).to eq(new_user_registration_path)
    end
  end
end
