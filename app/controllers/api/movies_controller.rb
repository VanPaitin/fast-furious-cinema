class Api::MoviesController < ApplicationController
  before_action :authenticate_admin_user!

  def update

  end

  private

  def movie_params
    params.require(:movie).permit()
  end
end
