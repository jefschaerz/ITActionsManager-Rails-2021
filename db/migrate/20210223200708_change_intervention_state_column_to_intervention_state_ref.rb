class ChangeInterventionStateColumnToInterventionStateRef < ActiveRecord::Migration[6.1]
  def change
    remove_column :interventions, :state
    add_column :interventions, :status, :integer, references: :intervention_states
  end
end
