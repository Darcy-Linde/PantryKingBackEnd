class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.integer :api_id
      t.string :title
      t.string :image
      t.date :date

      t.timestamps
    end
  end
end
