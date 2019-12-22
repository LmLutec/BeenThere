class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :occasion
      t.string :satisfaction
      t.string :revisit
      t.string :suggest
      t.string :living
      t.string :stay_length
      t.string :food_rating
      t.string :events
      t.string :comments
      t.string :cost_level
      t.integer :user_id
      t.integer :location_id
      t.integer :review_id 

      t.timestamps
    end
  end
end
