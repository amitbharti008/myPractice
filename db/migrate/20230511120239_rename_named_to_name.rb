class RenameNamedToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :named, :name

  end
end
