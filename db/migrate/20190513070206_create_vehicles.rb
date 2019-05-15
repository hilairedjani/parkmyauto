class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
        t.string :license_plate, null: false
        t.string :colour
        t.string :make, null: false
        t.string :model
        t.string :year
        t.boolean :status, default: false

        t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
