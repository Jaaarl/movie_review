module MoviesHelper
  def your_rating(movie)
    unless movie.reviews.where(user_id: current_user.id).empty?
      movie.reviews.where(user_id: current_user.id)[0]&.rating
    else
      0.0
    end
  end

  def average_rating(movie)
    ratings = movie.reviews.map(&:rating).compact
    return 0.0 if ratings.empty?

    total = ratings.sum
    average = total / ratings.size.to_f
    average
  end
end
