class ResetSchema < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_title, :string
    add_column :posts, :description, :string

    add_column :events, :event_name, :string
    add_column :events, :description, :string

    add_column :forums, :forum_title, :string
    add_column :forums, :forum_name, :string

  end
end
