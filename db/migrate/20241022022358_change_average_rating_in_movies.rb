class ChangeAverageRatingInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :average_rating, :decimal, precision: 10, scale: 2
  end
end
