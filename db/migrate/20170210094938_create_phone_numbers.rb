class CreatePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_numbers do |t|
      t.references :profile
      t.string     :number
      t.timestamps
    end
  end
end
