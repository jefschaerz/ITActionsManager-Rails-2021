class Device < ApplicationRecord
  # This knows to use the equipment_type_id field in the databas
  belongs_to :equipment_type
end
