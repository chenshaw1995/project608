class ChangeItemInTable < ActiveRecord::Migration[5.1]
  def up
    remove_column :comments, :music_id,:integer
    remove_column :comments, :user_id, :integer
  end
  def down
  end
  
end
