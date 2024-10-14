class Movie < ApplicationRecord
  belongs_to :user

  has_many :movie_category_ships
  has_many :categories, through: :movie_category_ships
end