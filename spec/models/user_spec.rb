require 'rails_helper'

RSpec.describe User, type: :model do

  let (:owner) {
    create(:user)
  }

  let (:other_user) {
    create(:user)
  }

  it 'factory is valid' do
    expect(build(:user)).to be_valid
  end

  it 'assigns desks to user' do
    create(:desk, owner: owner)
    create(:desk, owner: owner)
    create(:desk, owner: other_user)

    expect(owner.desks.count).to eq 2
  end

  describe 'date_of_birth' do
    it 'is required' do
      expect(build(:user, date_of_birth: nil)).to_not be_valid
    end
  end
end
