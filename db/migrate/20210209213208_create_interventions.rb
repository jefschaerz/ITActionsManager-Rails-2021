class CreateInterventions < ActiveRecord::Migration[6.1]
  def change
    create_table :interventions do |t|
      t.datetime :date
      t.string :summary
      t.text :details
      t.boolean :state
      t.references :resource, null: false, foreign_key: true
      t.references :intervention_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
