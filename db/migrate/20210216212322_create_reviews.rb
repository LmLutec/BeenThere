class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :occasion
      t.float :satisfaction
      t.float :revisit
      t.text :suggest
      t.text :living
      t.text :stay_length
      t.integer :food_rating
      t.text :events
      t.text :additional_info
      t.text :cost_level
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
    change_column :reviews, :satisfaction, 'integer USING CAST(satisfaction AS integer)'

  end

end
