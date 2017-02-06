class AddShortDesciptionToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :short_desc, :string, limit: 140
  end
end
