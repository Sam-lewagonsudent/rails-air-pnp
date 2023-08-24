class RemoveColumnsFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :deposit, :boolean
    remove_column :reservations, :end_date, :date
  end
end
