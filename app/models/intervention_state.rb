class InterventionState < ApplicationRecord
  has_many :interventions

# Validation :
  validates_presence_of :description

end
