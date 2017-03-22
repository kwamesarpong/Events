class AddExpiryDateToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :expiry_date, :date, null: true
  end
end
