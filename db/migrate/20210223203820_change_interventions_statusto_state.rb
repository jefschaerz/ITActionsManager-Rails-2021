class ChangeInterventionsStatustoState < ActiveRecord::Migration[6.1]
  def change
    add_column :interventions, :state_id, :integer, references: :intervention_states, :default => 1
  end
end
