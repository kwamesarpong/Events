class RemoveSenderFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :sender
  end
end
