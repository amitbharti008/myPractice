class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :description
    
      t.timestamps
    end
  end
end
