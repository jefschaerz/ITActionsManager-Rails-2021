class EquipmentType < ApplicationRecord  
    # This knows to look at the Devices class and find the foreign key in that table
    has_many :resources
    has_many :devices
end
