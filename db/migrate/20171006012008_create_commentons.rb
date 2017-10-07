class CreateCommentons < ActiveRecord::Migration[5.1]
  def change
    create_table :commentons do |t|
      t.references :music, foreign_key: true
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
  def down 
    drop_table :commentons
  end
end
