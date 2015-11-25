module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable
  end

  def is_liked_by?(user)
    likes.where(user: user).count > 0
  end

  def like_for_user(user)
    likes.where(user: user).first
  end
end