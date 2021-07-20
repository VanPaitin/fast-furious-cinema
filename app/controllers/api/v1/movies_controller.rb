class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_admin_user!

  def update
    movie = Movie.find(params[:id])

    if movie.update(movie_params)
      render json: movie.as_json.merge(details: movie.details)
    else
      render json: movie.errors, status: 422
    end
  end

  private

  def movie_params
    params.permit(details_attributes: [:id, :show_time, :price, :_destroy])
  end
end
