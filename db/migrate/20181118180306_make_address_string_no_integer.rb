class MakeAddressStringNoInteger < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :address, :string
  end

  def down
    change_column :users, :address, :integer
  end
end
