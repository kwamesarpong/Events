class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.references :profile, index: true
      t.references :category, index: true
      t.string     :picture
      t.string     :desc_service
      t.integer    :price
      t.timestamps
    end
  end
end
