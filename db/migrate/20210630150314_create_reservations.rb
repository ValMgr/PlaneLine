class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :id
      t.integer :numeroVol
      t.integer :idUser
      t.datetime :heureReservation
      t.string :classe
      t.integer :nombrePlaces

      t.timestamps
    end
  end
end
