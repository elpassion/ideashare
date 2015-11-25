require 'rails_helper'

RSpec.describe User, type: :model do

  let (:owner) { create(:user) }

  let (:other_user) { create(:user) }

  let (:user_with_empty_date_of_birth) { build(:user, date_of_birth: nil)}

  it 'factory is valid' do
    expect(build(:user)).to be_valid
  end

  it 'assigns desks to user' do
    expect { create(:desk, owner: owner)
             create(:desk, owner: owner)
             create(:desk, owner: other_user)
           }.to change { owner.desks.count }.by(2)
  end

  describe 'date_of_birth' do
    it 'is required' do
      expect(user_with_empty_date_of_birth).to_not be_valid
      expect(user_with_empty_date_of_birth.errors[:date_of_birth]).to_not be_empty
    end
  end
end
