class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :profile
      t.string     :physical_address
      t.timestamps
    end
  end
end
