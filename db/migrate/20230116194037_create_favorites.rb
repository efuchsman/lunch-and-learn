class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :country
      t.string :recipe_title
      t.string :recipe_link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
