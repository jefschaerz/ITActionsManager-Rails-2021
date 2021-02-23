class CreateInterventionStates < ActiveRecord::Migration[6.1]
  def change
    create_table :intervention_states do |t|
      t.string :description

      t.timestamps
    end
  end
end
