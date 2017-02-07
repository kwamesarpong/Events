class AddBannerToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :banner, :string 
  end
end
