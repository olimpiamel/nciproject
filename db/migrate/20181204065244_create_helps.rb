class CreateHelps < ActiveRecord::Migration[5.2]
  def change
    create_table :helps do |t|
      t.string :issue
      t.text :description

      t.timestamps
    end
  end
end
