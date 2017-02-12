class SeparateAuthFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :providers
    remove_column :users, :uid
  end
end
