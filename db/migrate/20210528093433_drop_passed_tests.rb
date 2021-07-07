class DropPassedTests < ActiveRecord::Migration[6.0]
  def change
    drop_table :passed_tests, if_exists: true
  end
end
