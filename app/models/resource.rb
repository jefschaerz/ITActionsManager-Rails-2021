class Resource < ApplicationRecord
    # This knows to use the equipment_type_id field in the database
    belongs_to :equipment_type
end
