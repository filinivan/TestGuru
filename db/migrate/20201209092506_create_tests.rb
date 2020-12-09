class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, limit: 70, null: false
      t.integer :level, null: false, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
