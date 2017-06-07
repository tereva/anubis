class AddHitToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :hit, :integer
  end
end
