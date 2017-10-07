class CreateAuthors < ActiveRecord::Migration[5.1]
  def up
    create_table :authors do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
  def down
    drop_table :authors
  end
end
