class Idea < ActiveRecord::Base
  include Likeable

  validates :owner_id, uniqueness: {scope: :desk_id, message: "User can't add multiple ideas to single desk"}
  belongs_to :owner, class_name: 'User', required: true

  belongs_to :desk, required: true

  validates :name, presence: true

  validate :cant_add_idea_to_expired_desk

  scope :by_owner, -> (user) { where(owner_id: user) }

  private

  def cant_add_idea_to_expired_desk
    if desk && desk.finish_at < Time.current
      errors.add(:desk, "can't add idea to expired desk")
    end
  end
end
