class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.references      :category, index: true
      t.string          :name
      t.string          :sub_cat_image
      t.timestamps
    end
  end
end
