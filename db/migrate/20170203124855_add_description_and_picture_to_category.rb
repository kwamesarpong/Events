class AddDescriptionAndPictureToCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :services, :description
    remove_column :services, :service_pic

    add_column :categories, :description, :string
    add_column :categories, :category_pic, :string
  end
end
