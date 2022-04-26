class AddTimeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time, :integer, null: false, default: 0
  end
end
