class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string :method
      t.string :time_to
      t.string :time_from
      t.string :cost_level
      t.string :from_city
      t.string :from_state
      t.string :from_country
      t.string :to_city
      t.string :to_state
      t.string :to_country

      t.timestamps
    end
  end
end
