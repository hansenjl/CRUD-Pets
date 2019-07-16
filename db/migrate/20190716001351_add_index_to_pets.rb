class AddIndexToPets < ActiveRecord::Migration[5.2]
  def change
    add_index :pets, :species
  end
end
