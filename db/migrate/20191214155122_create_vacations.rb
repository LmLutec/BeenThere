class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |t|
      t.string :occasion
      t.datetime :start_date
      t.datetime :end_date
      t.string :city
      t.string :state
      t.string :country
      t.integer :user_id
      t.integer :transportation_id
      t.integer :review_id 

      t.timestamps
    end
  end
end
