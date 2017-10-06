class CreateAuthors < ActiveRecord::Migration[5.1]
  def up
    create_table :authors do |t|
      t.integer :user_id
      t.integer :comment_id
      t.timestamps
    end
    
    add_foreign_key :authors, :users
    add_foreign_key :authors, :comments
  end
  def down
    drop_table :authors
  end
end
