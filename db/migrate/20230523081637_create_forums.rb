class CreateForums < ActiveRecord::Migration[6.1]
  def change
    create_table :forums do |t|
      
      t.string :forum_title
      t.string :forum_name
      t.timestamps
    end
  end
end
