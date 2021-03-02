class Device < ApplicationRecord
  # This knows to use the equipment_type_id field in the databas
  belongs_to :equipment_type

  def self.options_for_select
    order("LOWER(description)").map { |e| [e.description, e.id] }
  end
end
