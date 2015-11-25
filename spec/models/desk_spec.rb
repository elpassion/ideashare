require 'rails_helper'

RSpec.describe Desk, type: :model do
  let(:desk) { build(:desk) }
  let(:user) { build(:user) }

  it 'factory is valid' do
    expect(desk).to be_valid
  end

  describe 'owner' do
    it 'is required' do
      desk.owner = nil
      expect(desk).not_to be_valid
    end
  end

  describe 'finish_date' do
    it 'is presence' do
      desk.finish_at = nil
      expect(desk).not_to be_valid
    end

    it 'finish date has to be after start date' do
      desk.finish_at = 1.day.ago(desk.start_at)
      expect(desk).not_to be_valid
    end

    it 'finish date cannot be in the past' do
      desk.finish_at = 1.hour.ago(DateTime.current)
      expect(desk).not_to be_valid
    end
  end

  describe 'start_date' do
    it 'is presence' do
      desk.start_at = nil
      expect(desk).not_to be_valid
    end
  end

  describe 'owner' do
    let(:idea) {
      build(:idea, owner: user, desk: desk)
    }

    before do
      desk.save
      idea.save
    end

    it 'has only one idea by specific user in desk' do
      user.save

      second_idea = Idea.create(owner: user, desk: desk, name: 'New user idea')
      second_idea.save

      expect { second_idea.save }.not_to change { desk.ideas.count }
      expect(desk.ideas.first.name).to eq idea.name
      expect(second_idea.errors).to include(:owner_id)
    end

    it 'has multiple idea by different user in single' do
      expect { create(:idea, desk: desk, name: 'First idea')
      create(:idea, desk: desk, name: 'Other idea') }.to change { desk.ideas.count }.by(2)
    end
  end
end
