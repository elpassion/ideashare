require 'rails_helper'

RSpec.describe Desk, type: :model do

  it 'factory is valid' do
    expect(build(:desk)).to be_valid
  end

  describe 'owner' do
    it 'is required' do
      expect(build(:desk, owner: nil)).to_not be_valid
    end
  end

  describe 'finish_date' do
    it 'is presence' do
      expect(build(:desk, finish_at: nil)).to_not be_valid
    end

    it 'finish date has to be after start date' do
      desk = build(:desk)
      desk.finish_at = desk.start_at - 1
      expect(desk).to_not be_valid
    end

    it 'finish date cannot be in the past' do
      desk = build(:desk)
      desk.finish_at = DateTime.current - 1.hours
      expect(desk).to_not be_valid
    end
  end

  describe 'start_date' do
    it 'is presence' do
      expect(build(:desk, start_at: nil)).to_not be_valid
    end
  end

  describe 'owner' do
    it 'has only one idea by specific user in desk' do
      desk = create(:desk)
      user = create(:user)
      idea_name = "User idea"

      create(:idea, owner: user, desk: desk, name: idea_name)
      second_idea = build(:idea, owner: user, desk: desk, name: "New user idea")
      second_idea.save

      expect(desk.ideas.count).to eq 1
      expect(desk.ideas.first.name).to eq idea_name
      expect(second_idea.errors).to include(:user)
    end

    it 'has multiple idea by different user in single' do
      desk = create(:desk)

      create(:idea, desk: desk, name: 'First idea')
      create(:idea, desk: desk, name: 'Other idea')

      expect(desk.ideas.count).to eq 2
    end
  end
end
