class RemoveResourceFromInterventions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :interventions, :resource, null: false, foreign_key: true
  end
end
