class RemoveRecipientFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :recipient
  end
end
