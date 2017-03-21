class AddNumberOfServicesToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :number_of_uploads, :integer, default: 1
    add_column :subscriptions, :google_calendar, :boolean, default: false
  end
end
