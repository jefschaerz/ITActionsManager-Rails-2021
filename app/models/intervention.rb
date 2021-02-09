class Intervention < ApplicationRecord
  belongs_to :resource
  belongs_to :intervention_type
  belongs_to :user
end
