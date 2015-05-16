class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :recipe, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
