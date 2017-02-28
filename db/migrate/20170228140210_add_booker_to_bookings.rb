class AddBookerToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :booker, foreign_key: { to_table: :users }
  end
end
