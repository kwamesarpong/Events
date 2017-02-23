class MakePriceString < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :price, :string, null: false, default: "Free"
  end
end
