class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
        t.integer :role_name, null: false, default: 0
        t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
