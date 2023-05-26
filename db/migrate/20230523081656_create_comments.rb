class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
  
      t.string :content
      t.string :commentable_type
      t.integer :commentable_id 
      t.timestamps
    end
  end
end
