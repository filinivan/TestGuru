class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.belongs_to :test
      t.has_one :answer

      t.timestamps
    end
  end
end
