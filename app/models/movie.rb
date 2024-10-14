class Movie < ApplicationRecord
  belongs_to :user

  has_many :movie_category_ships
  has_many :category, through: :movie_category_Ships
end