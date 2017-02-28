class BookingAcceptOrReject < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :accepted, :boolean, default: false
  end
end
