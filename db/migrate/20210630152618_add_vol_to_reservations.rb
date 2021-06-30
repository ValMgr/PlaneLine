class AddVolToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :vol, null: false, foreign_key: true
  end
end
