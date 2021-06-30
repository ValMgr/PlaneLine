class CreateVols < ActiveRecord::Migration[6.1]
  def change
    create_table :vols do |t|
      t.integer :number
      t.string :departure_airport
      t.string :arrival_airport
      t.integer :business_class_seats
      t.integer :economy_class_seats
      t.datetime :departure_date
      t.integer :duration

      t.timestamps
    end
  end
end
