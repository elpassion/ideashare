class Idea < ActiveRecord::Base
  validates_uniqueness_of :owner_id, scope: :desk_id
  belongs_to :owner, class_name: 'User', required: true

  belongs_to :desk, required: true

  validates :name, presence: true

  validate :user_can_add_only_one_idea_to_specific_desk
  validate :cant_add_idea_to_expired_desk

  scope :by_owner, -> (user) { where(owner_id: user) }

  private

  def user_can_add_only_one_idea_to_specific_desk
    if desk && owner && desk.ideas.by_owner(owner).first
      errors.add(:user, "can't add multiple ideas to single desk")
    end
  end

  def cant_add_idea_to_expired_desk
    if desk && desk.finish_at < Time.current
      errors.add(:desk, "can't add idea to expired desk")
    end
  end
end
