class AddImagesToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :images, :string
  end
end
