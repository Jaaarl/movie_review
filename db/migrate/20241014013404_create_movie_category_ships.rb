class CreateMovieCategoryShips < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_category_ships do |t|
      t.references :movie
      t.references :category
      t.timestamps
    end
  end
end
