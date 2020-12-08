class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :title
      t.has_many :tests

      t.timestamps
    end
  end
end
