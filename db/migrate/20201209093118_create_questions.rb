class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, limit: 70
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
