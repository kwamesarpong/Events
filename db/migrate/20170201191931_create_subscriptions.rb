class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string  :name
      t.integer :amount
      t.boolean :recurring
      t.timestamps
    end
  end
end
