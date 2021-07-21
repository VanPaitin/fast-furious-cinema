class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_admin_user!, only: :update

  def index
    # Given that we have very few movies in the cinema, we do not make an attempt to paginate
    render json: MovieSerializer.new(Movie.all).serializable_hash
  end

  def show
    imdb_id = Movie.find(params[:id]).imdb_id
    url = "#{ENV['OMDB_API_HOST']}/?apikey=#{ENV['OMDB_API_KEY']}&i=#{imdb_id}"
    response = HTTParty.get(url)
    
    render json: response.body, status: response.code
  end

  def update
    movie = Movie.find(params[:id])

    if movie.update(movie_params)
      render json: MovieSerializer.new(movie).serializable_hash
    else
      render json: movie.errors, status: 422
    end
  end

  private

  def movie_params
    params.permit(details_attributes: [:id, :show_time, :price, :_destroy])
  end
end
