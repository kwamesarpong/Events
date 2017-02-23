class ChangePriceToUserSpec < ActiveRecord::Migration[5.0]
  def change
    remove_column :services, :price
  end
end
