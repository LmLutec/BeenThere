class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :occasion
      t.string :satisfaction
      t.string :revisit
      t.string :suggest
      t.string :living
      t.string :stay_length
      t.integer :food_rating
      t.string :events
      t.string :additional_info
      t.string :cost_level
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
