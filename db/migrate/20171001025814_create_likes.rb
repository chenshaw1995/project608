class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :music_id
      t.integer :user_id
      t.timestamps
    end
    
    add_index :likes, :music_id
    add_foreign_key :likes, :musics
    add_index :likes, :user_id
    add_foreign_key :likes, :users
  end
end