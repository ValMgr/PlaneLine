class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :heure_reservation
      t.string :classe
      t.integer :nombre_places

      t.timestamps
    end
  end
end
