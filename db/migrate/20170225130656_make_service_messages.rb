class MakeServiceMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :service, index: true
  end
end
