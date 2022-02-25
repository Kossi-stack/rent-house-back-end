class Api::V1::FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  def index
    @favorites = current_user.favorites
    render json: @favorites
  end

  def create
    @favorite = current_user.favorites.new(favorite_params)
    if @favorite.save
      render json: @favorite
    else
      render json: { errors: @favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @favorite.destroy
      render json: { message: 'Favorite deleted' }
    else
      render json: { errors: @favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:house_id)
  end
end

