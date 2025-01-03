class AddItemsToFights < ActiveRecord::Migration[7.0]
  def change
    add_column :fights, :defender_item_id, :integer 
    add_column :fights, :attacker_item_id, :integer 
  end
end
