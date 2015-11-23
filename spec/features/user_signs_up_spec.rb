require 'rails_helper'

feature 'User signs up' do

  scenario 'with valid email and password' do
    visit '/'
    click_link 'Join'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully.')
    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    visit '/'
    click_link 'Join'
    fill_in 'Email', with: 'test'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('is invalid')
  end

  scenario 'with blank password' do
    visit '/'
    click_link 'Join'
    fill_in 'Email', with: 'test@email.com'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
end