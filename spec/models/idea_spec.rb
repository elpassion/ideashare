require 'rails_helper'

RSpec.describe Idea, type: :model do

  it 'factory is valid' do
    expect(build(:idea)).to be_valid
  end

  describe 'owner' do
    it 'is assigned to user' do
      expect(build(:idea, owner: nil)).to_not be_valid
    end
  end

  describe 'assignation to desk' do
    it 'is assigned to desk' do
      expect(build(:idea, desk: nil)).to_not be_valid
    end
  end

  describe 'name' do
    it 'is required' do
      expect(build(:idea, name: nil)).to_not be_valid
    end
  end

  describe 'if time is up to add new idea' do
    xit 'will not add idea to an expired desk' do
      finish_time = DateTime.current + 3.hours
      desk = build(:desk, finish_at: finish_time)
      Timecop.travel(finish_time)
      expect(build(:idea, desk: desk)).to_not be_valid
    end
  end
end
