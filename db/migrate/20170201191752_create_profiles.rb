class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, index: true 
      t.references :subscription, index: true
      t.string     :name_of_agency
      t.string     :desc
      t.string     :profile_picture
      t.boolean    :paid
      t.timestamps
    end
  end
end
