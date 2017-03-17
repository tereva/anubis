class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :web
      t.string :title
      t.text :description
      t.string :kw
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
