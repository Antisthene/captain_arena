class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :health_point, default: 50
      t.integer :attack, default: 10
      t.integer :dexterity, default: 10
      t.integer :intelligence, default: 10
      t.integer :experience, default: 0
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
