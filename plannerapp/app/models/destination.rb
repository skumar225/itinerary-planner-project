class Destination < ActiveRecord::Base
  validates :location, :name, :destination_date, presence: true

  belongs_to :plan
  has_many :trips, dependent: :destroy
  has_many :companions, through: :trips
end
