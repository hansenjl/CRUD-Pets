class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.integer :vet_id
      t.integer :reviewer_id

      t.timestamps
    end
  end
end
