class Api::V1::HousesController < ApplicationController

  def index
    @houses = House.all
    render json: @houses
  end

  def show
    @house = House.find(params[:id])
    render json: @house
  end

  def create
    @house = current_user.houses.new(house_params)
    if @house.save
      render json: @house
    else
      render json: { errors: @house.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    render json: @house
  end

  private

  def house_params
    params.require(:house).permit(:name, :rooms, :beds, :baths, :price, :rating, :image_url, :description)
  end
end
