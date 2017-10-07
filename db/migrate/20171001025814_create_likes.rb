class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :music, foreign_key: true
      t.timestamps
    end
    
    add_index :likes, [:music_id,:user_id]
  end
end