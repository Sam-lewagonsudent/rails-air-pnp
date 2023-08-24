class AddDateAndTimeToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :date, :date
    add_column :reservations, :start_time, :time
    add_column :reservations, :end_time, :time
  end
end
