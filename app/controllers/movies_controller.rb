class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @movies = Movie.includes(:categories)

    if params[:category].present?
      @movies = @movies.filter_by_category(params[:category])
    end
    @movies = @movies.page(params[:page]).per(6)
    session[:current_page] = params[:page] || 1
  end

  def show
    @movie = Movie.find(params[:id])
    @ordered_reviews = @movie.reviews.order(rating: :desc)
    @movie.update(average_rating: average_rating(@movie))
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      redirect_to movies_path, notice: 'Movie was added.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path(page: session[:current_page] || 1), notice: "Movie was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

  def average_rating(movie)
    ratings = movie.reviews.map(&:rating).compact
    return "0.0" if ratings.empty?

    total = ratings.sum
    total / ratings.size.to_f
  end
  
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :blurb, :released, :country_of_origin, :showing_start, :showing_end, :average_rating, :user_id, category_ids: [])
  end
end