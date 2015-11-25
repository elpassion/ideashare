class Desk < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', required: true

  validates :start_at, presence: true

  validates :finish_at, presence: true
  validates :finish_at, date: {after: Proc.new { Time.current }, message: "Finish date can't be in the past"}
  validates :finish_at, date: {after: :start_at, message: "Finish date can't be before start date"}

  has_many :ideas, dependent: :destroy
end
