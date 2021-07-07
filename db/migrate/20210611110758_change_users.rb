class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t| 
      t.rename :username, :email # t.string -> t.rename 
    end 
  end
end
