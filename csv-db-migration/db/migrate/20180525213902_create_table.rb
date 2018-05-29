class CreateTable < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.integer :phone_number
    end
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.integer :cost_price
      t.integer :sale_markup
    end
    
  end
end
