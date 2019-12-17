class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |t|
      t.string :occasion
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
