class AddToReservationForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :pool, foreign_key: true
  end
end
