class CreateCommentons < ActiveRecord::Migration[5.1]
  def change
    create_table :commentons do |t|
      t.integer :music_id
      t.integer :comment_id
      t.timestamps
    end
    
    add_foreign_key :commentons, :musics
    add_foreign_key :commentons, :comments
  end
  def down 
    drop_table :commentons
  end
end
