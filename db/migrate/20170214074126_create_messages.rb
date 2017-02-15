class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :mail_box
      t.string     :body
      t.string     :recipient
      t.timestamps
    end
  end
end
