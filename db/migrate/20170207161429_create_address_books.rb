class CreateAddressBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :address_books do |t|
      t.references :profile, index: true
      t.string     :adress
      t.string     :phone_number
      t.string     :location
      t.timestamps
    end
  end
end
