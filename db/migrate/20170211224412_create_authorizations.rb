class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.string     :provider
      t.string     :uid
      t.references :user
      t.timestamps
    end
  end
end
