require 'rails_helper'

RSpec.feature 'User signs up', type: :feature do

  scenario 'with valid email and password' do
    visit '/'
    click_link 'Join'
    page.select('2015', from: 'user_date_of_birth_1i', match: :first)
    page.select('May', from: 'user_date_of_birth_2i', match: :first)
    page.select('1', from: 'user_date_of_birth_3i', match: :first)
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
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