class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :service, index: true
      t.references :user, index: true
      t.string     :message
      t.integer    :co_efficient
      t.timestamps
    end
  end
end
