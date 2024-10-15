class ReviewsController < ApplicationController
  def new
    @movie = Movie.includes(reviews: :user).find(params[:movie_id])
    @review = @movie.reviews.new
  end

  def create
    @movie = Movie.includes(reviews: :user).find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @movie, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
    @movie = Movie.includes(reviews: :user).find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
  end

  def update
    @movie = Movie.includes(reviews: :user).find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
  
    if @review.update(review_params)
      redirect_to @movie, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.includes(reviews: :user).find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to @movie, notice: 'Review was successfully deleted.'
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end