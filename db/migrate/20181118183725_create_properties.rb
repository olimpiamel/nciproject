class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :user_id
      t.integer :price
      t.text :description
      t.string :address
      t.string :status

      t.timestamps
    end
  end
end
