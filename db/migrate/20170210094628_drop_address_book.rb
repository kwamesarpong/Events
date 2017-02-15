class DropAddressBook < ActiveRecord::Migration[5.0]
  def change
    drop_table :address_books
  end
end
