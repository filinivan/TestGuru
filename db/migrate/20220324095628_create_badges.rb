class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
