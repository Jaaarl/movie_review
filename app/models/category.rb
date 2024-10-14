class Category < ApplicationRecord
  validates :name, presence: true

  has_many :movie_category_ships
  has_many :movies, through: :movie_category_ships
end
