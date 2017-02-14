class CreateMailBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :mail_boxes do |t|
      t.references :user
      t.timestamps
    end
  end
end
