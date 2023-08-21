class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :deposit
      t.boolean :owner_acceptation

      t.timestamps
    end
  end
end
