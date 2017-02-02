class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: "info@eventicise.com"
      t.string :username
      t.string :password_digest
      t.integer :kind
      t.timestamps
    end
  end
end
