class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :music_id
      t.integer :user_id
      t.timestamps
    end
    
    add_index :comments, :music_id
    add_foreign_key :comments, :musics
    add_index :comments, :user_id
    add_foreign_key :comments, :users
  end
end
