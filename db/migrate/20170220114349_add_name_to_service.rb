class AddNameToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :name_of_service, :string 
  end
end
