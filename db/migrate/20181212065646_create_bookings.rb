class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_Date
      t.datetime :end_Date
      t.references :property, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
