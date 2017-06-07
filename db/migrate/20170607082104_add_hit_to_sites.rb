class AddHitToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :hit, :integer
  end
end
