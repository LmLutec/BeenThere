class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |t|
      t.string :type
      t.datetime :start_date
      t.datetime :end_date
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
