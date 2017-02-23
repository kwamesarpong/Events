class AddMetricToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :metric, :string
  end
end
