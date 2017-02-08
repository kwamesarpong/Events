class AddTagLineToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :tagline, :string, limit: 26, default: "Call We Serve"
  end

end
