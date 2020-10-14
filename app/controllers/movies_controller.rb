class MoviesController < ApplicationController
   before_action :authenticate_user!, only: [:show]
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
  end
end
