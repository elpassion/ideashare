require 'rails_helper'

RSpec.feature 'User visits desks index page', type: :feature do

  scenario 'visit desks index' do
    visit 'desks/'

    within('.ui-accordion-header') do
      expect(page).to have_content('What to eat?')
    end

    within('.ui-accordion-content') do
      expect(page).to have_content('Ice cream')
    end

    click_link('/desks?page=2')

    within('.ui-accordion-header') do
      expect(page).to have_content('What to do?')
    end

    within('.ui-accordion-content') do
      expect(page).to have_content('Sleep')
    end
  end
end