class Desk < ActiveRecord::Base
  validates :owner, presence: true
  belongs_to :owner, class_name: User

  validates :start_at, presence: true

  validates :finish_at, presence: true
  validate :finish_date_cannot_be_in_the_past
  validate :finish_date_cannot_be_before_start_date

  has_many :ideas

  private

  def finish_date_cannot_be_in_the_past
    if finish_at && (finish_at < Time.current)
      errors.add(:finish_at, "can't be in the past")
    end
  end

  def finish_date_cannot_be_before_start_date
    if finish_at && start_at && (finish_at < start_at)
      errors.add(:finish_at, "can't be before start")
    end
  end
end
