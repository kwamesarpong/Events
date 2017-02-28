class RemoveUserIdFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :user_id
  end
end
