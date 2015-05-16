class AddStatusToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :status, :integer, default: 0, null: false
  end
end
