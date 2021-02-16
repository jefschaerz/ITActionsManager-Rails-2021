class Intervention < ApplicationRecord
  belongs_to :device
  belongs_to :intervention_type
  belongs_to :user
end
