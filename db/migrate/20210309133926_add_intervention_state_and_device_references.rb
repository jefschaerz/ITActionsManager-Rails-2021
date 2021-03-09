class AddInterventionStateAndDeviceReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :interventions, :intervention_state, null: false, foreign_key: true
    add_reference :interventions, :device, null: false, foreign_key: true
  end
end
