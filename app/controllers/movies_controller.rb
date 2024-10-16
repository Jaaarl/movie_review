class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @movies = Movie.includes(:categories)

    if params[:category].present?
      @movies = @movies.filter_by_category(params[:category])
    end

    @movies = @movies.page(params[:page]).per(3)
  end

  def show
    @movie = Movie.find(params[:id])
    @ordered_reviews = @movie.reviews.order(rating: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :blurb, :released, :country_of_origin, :showing_start, :showing_end, :user_id, category_ids: [])
  end
end