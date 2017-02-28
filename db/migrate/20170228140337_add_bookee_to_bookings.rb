class AddBookeeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :bookee, foreign_key: { to_table: :users }
  end
end
