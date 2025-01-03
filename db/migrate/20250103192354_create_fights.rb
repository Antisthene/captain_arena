class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :attacker, null: false
      t.references :defender, null: false
      t.references :winner
      t.references :loser
      t.string :result

      t.timestamps
    end
  end
end
