class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :island
      t.string :city
      t.string :street
      t.string :zip
      t.string :phone
      t.float :lat, :precision=>10, :scale=>6
      t.float :long, :precision=>10, :scale=>6
      t.references :site, foreign_key: true
      t.timestamps
    end
  end
end
