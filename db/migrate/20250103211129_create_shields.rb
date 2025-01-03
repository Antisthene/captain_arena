class CreateShields < ActiveRecord::Migration[7.0]
  def change
    create_table :shields do |t|
      t.string :name
      t.integer :defense
      t.integer :require_dexterity

      t.timestamps
    end
  end
end
