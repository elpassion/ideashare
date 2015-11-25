require 'rails_helper'

RSpec.feature 'Add new idea', type: :feature do
  let(:user) { create(:user) }
  let(:desk) { create(:desk) }

  scenario 'authorized user can add new desk' do
    visit '/'
    click_link 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/desks/#{desk.id}"

    click_link 'Add new idea'

    expect(current_path).to eq("/desks/#{desk.id}/ideas/new")

    fill_in 'Name', with: 'Idea name'
    fill_in 'Description', with: 'Such great idea'

    expect {
      click_button 'Add'
    }.to change { desk.reload.ideas.count }.by(1)

    expect(page).to have_content('Idea was successfully added.')
    expect(desk.ideas.first.owner).to eq(user)
    expect(current_path).to eq("/desks/#{desk.id}")
  end

  scenario 'unauthorized user can not add new desk' do
    visit "/desks/#{desk.id}"

    expect(page).not_to have_content('Add new idea')
  end
end
