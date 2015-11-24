class Desk < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', required: true

  validates :start_at, presence: true

  validates :finish_at, presence: true
  validates :finish_at, date: {after: Proc.new { Time.current }}
  validates :finish_at, date: {after: :start_at}

  has_many :ideas, dependent: :destroy
end
