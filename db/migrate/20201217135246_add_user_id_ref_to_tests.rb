class AddUserIdRefToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :users, foreign_key: true
  end
end
