require 'rails_helper'

RSpec.feature 'Add new desk', type: :feature do

  let(:user) { create(:user) }

  scenario 'authorized user adds desk with name, description and valid dates' do
    visit '/'
    click_link 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Desks'
    click_link 'Add new desk'

    fill_in 'Desk name', with: 'desk name'
    fill_in 'Description', with: 'desc'

    date_today = Time.current
    tommorow = 1.day.from_now

    page.select(date_today.strftime('%Y'), from: 'desk_start_at_1i', match: :first)
    page.select(date_today.strftime('%B'), from: 'desk_start_at_2i', match: :first)
    page.select(date_today.strftime('%e'), from: 'desk_start_at_3i', match: :first)

    page.select(tommorow.strftime('%Y'), from: 'desk_finish_at_1i', match: :first)
    page.select(tommorow.strftime('%B'), from: 'desk_finish_at_2i', match: :first)
    page.select(tommorow.strftime('%e'), from: 'desk_finish_at_3i', match: :first)

    expect {
      click_button 'Add'
    }.to change { Desk.count }.by(1)

    expect(page).to have_content('Desk was successfully added.')
  end

  scenario 'unauthorized user cannot add new desk' do
    visit '/'
    click_link 'Desks'

    expect(page).to_not have_content('Add new desk')
  end

  scenario 'authorized user adds desk with wrong dates' do
    visit '/'
    click_link 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Desks'
    click_link 'Add new desk'

    fill_in 'Desk name', with: 'desk name'
    fill_in 'Description', with: 'desc'

    date_today = Time.current
    tommorow = 2.days.ago

    page.select(date_today.strftime('%Y'), from: 'desk_start_at_1i', match: :first)
    page.select(date_today.strftime('%B'), from: 'desk_start_at_2i', match: :first)
    page.select(date_today.strftime('%e'), from: 'desk_start_at_3i', match: :first)

    page.select(tommorow.strftime('%Y'), from: 'desk_finish_at_1i', match: :first)
    page.select(tommorow.strftime('%B'), from: 'desk_finish_at_2i', match: :first)
    page.select(tommorow.strftime('%e'), from: 'desk_finish_at_3i', match: :first)

    click_button 'Add'

    expect(page).to have_content("Finish date can't be in the past")
  end
end