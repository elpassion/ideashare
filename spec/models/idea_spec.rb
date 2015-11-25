require 'rails_helper'

RSpec.describe Idea, type: :model do

  it 'factory is valid' do
    expect(build(:idea)).to be_valid
  end

  describe 'owner' do
    it 'is assigned to user' do
      expect(build(:idea, owner: nil)).not_to be_valid
    end
  end

  describe 'assignation to desk' do
    it 'is assigned to desk' do
      expect(build(:idea, desk: nil)).not_to be_valid
    end
  end

  describe 'name' do
    it 'is required' do
      expect(build(:idea, name: nil)).not_to be_valid
    end
  end

  describe 'if time is up to add new idea' do
    xit 'will not add idea to an expired desk' do
      Timecop.freeze(2015, 10, 1, 11, 0)
      finish_time = DateTime.new(2015, 10, 1, 14, 0)
      desk = build(:desk, finish_at: finish_time)
      expect(build(:idea, desk: desk)).not_to be_valid
    end
  end
end
