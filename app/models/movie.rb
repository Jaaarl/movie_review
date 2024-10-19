class Movie < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  scope :filter_by_category, ->(categories) { where(categories: {id: categories} ) if categories.present? }
  
  validates :title, uniqueness: true

  belongs_to :user

  has_many :movie_category_ships
  has_many :categories, through: :movie_category_ships
  has_many :reviews

  def destroy
    update(deleted_at: Time.now)
  end

end