class Plan < ActiveRecord::Base

  validates :origin, :departure_date, :return_date, :creator_id, presence: true
  # validates :departure_date, date: {on_or_after: Date.today}
  # validates :return_date, date: {on_or_after: :departure_date}

  belongs_to :companion, foreign_key: :creator_id
  has_many :destinations, dependent: :destroy
  has_many :reviews, as: :reviewable
end
