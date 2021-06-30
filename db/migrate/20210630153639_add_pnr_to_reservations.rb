class AddPnrToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :pnr, :string
  end
end
