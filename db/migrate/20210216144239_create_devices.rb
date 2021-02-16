class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :description
      t.references :equipment_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
