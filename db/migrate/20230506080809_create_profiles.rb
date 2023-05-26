class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :address
      t.integer :phone_number
      t.string :city
      t.string :state
      t.string :country
      t.string :user_id
  
      t.timestamps
    end
  end
end
