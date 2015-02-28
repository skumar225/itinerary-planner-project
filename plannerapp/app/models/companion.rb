class Companion < ActiveRecord::Base
  # belongs_to :plan
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password

  has_many :plans
  has_many :reviews, as: :reviewable
  has_many :trips
  has_many :destinations, through: :trips
end
