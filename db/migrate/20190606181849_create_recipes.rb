class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :api_id
      t.string :title
      t.string :image
      t.string :instructions
      t.integer :servings
      t.integer :preparation_minutes
      t.integer :cooking_minutes
      t.integer :ready_in_minutes 
      t.integer :price_per_serving
      t.string :source_url
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :gluten_free
      t.boolean :dairy_free

      t.timestamps
    end
  end
end
