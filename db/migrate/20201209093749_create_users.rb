class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 70
      t.string :password, limit: 10
      t.integer :level

      t.timestamps
    end
  end
end
