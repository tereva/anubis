class CreateSocials < ActiveRecord::Migration[5.0]
	add_column :sites, :facebook, :string
    add_column :sites, :instagram, :string
    add_column :sites, :tweeter, :string
end
