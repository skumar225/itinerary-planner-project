class Trip < ActiveRecord::Base
  belongs_to :destination
  belongs_to :companion

  validates :companion_id, uniqueness: {scope: :destination_id}
end
