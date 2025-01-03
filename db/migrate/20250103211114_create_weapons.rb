class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :damage
      t.integer :require_dexterity
      t.integer :require_intelligence

      t.timestamps
    end
  end
end
