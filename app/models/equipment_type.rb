class EquipmentType < ApplicationRecord  
    # This knows to look at the Resources class and find the foreign key in that table
    has_many :resources
end
