module MoviesHelper
  def your_rating(movie)
    unless movie.reviews.where(user_id: current_user.id).empty?
      movie.reviews.where(user_id: current_user.id)[0]&.rating
    else
      0.0
    end
  end

  def average_rating(movie)
    arr = movie.reviews.map(&:rating)
    ave = 0.0
    if arr == []
      0.00
    else
      arr.each do |num|
        ave = ave + num
      end
      ave = ave / arr.size
    end
    ave
  end
end
