class AddNameToUsersAgain < ActiveRecord::Migration[5.0]
  def change
    add_column    :users, :name, :string
    add_column    :users, :providers, :string
    add_column    :users, :uid, :string
  end
end
