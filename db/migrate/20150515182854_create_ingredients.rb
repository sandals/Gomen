class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :recipe
      t.string :type
      t.string :measurement

      t.timestamps null: false
    end
  end
end
