class AddFromToMessages < ActiveRecord::Migration[5.0]
  def changes
    add_column :messages, :string, :from
  end
end
