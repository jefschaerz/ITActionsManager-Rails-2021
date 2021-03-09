class RemoveInterventionsStatusAndStateId < ActiveRecord::Migration[6.1]
  def change
    remove_column :interventions, :status
    remove_column :interventions, :state_id
  end
end
