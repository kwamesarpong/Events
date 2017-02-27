class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references  :user, index: true
      t.references  :service, index: true
      t.date        :day_booked
      t.timestamps
    end
  end
end
