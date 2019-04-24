class CreateVets < ActiveRecord::Migration[5.2]
  def change
    create_table :vets do |t|
      t.string :name
      t.string :location
      t.string :specialty
      t.integer :rating

      t.timestamps
    end
  end
end
