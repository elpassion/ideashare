module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit '/'
      click_link 'Join'
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end
  end
end