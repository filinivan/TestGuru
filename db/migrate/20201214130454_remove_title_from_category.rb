class RemoveTitleFromCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :title, :name
  end
end
