class AddPoiToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :poi, :boolean
  end
end
