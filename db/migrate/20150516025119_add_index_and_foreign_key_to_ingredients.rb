class AddIndexAndForeignKeyToIngredients < ActiveRecord::Migration
  def change
    add_foreign_key :ingredients, :recipes
    add_index :ingredients, :recipe_id
  end
end
