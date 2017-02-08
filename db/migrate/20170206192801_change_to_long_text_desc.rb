class ChangeToLongTextDesc < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :desc, :text, limit: 4294967295
  end
end
