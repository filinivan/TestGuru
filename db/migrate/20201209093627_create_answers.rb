class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, limit: 70
      t.references :question, null: false, foreign_key: true
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
