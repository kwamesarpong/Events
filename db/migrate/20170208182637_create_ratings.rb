class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references    :service, index: true
      t.integer       :star_index
      t.timestamps
    end
  end
end
