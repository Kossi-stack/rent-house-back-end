class Api::V1::FavoritesController < ApplicationController
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
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render json: @favorite
  end

  private

  def favorite_params
    params.require(:favorite).permit(:house_id, :user_id)
  end
end
