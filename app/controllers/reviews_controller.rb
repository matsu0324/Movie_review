class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_reviews_path(@review.movie)
    else
      @movie = Movie.find(params[:id])
      render "movie/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:movie_id, :score, :content)
  end
end
