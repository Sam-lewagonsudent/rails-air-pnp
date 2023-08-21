class AddToReservationForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :users, foreign_key: true
    add_reference :reservations, :pools, foreign_key: true
  end
end
