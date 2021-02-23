class Intervention < ApplicationRecord
  belongs_to :device
  belongs_to :intervention_type
  belongs_to :user
  
  # Search by the param in the query
  scope :search, ->(query) {where('details like ?', "%#{query}%") }
  # TODO : scope :search_by_device, ->(query) {where('device_id like ?', "%#{query}%") }
end

