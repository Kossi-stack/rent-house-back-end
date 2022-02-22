class Api::V1::HousesController < ApplicationController
  before_action :set_room, only: %i[destroy show]

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
    if @house.destroy
      render json: { message: 'House deleted' }
    else
      render json: { errors: @house.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :rooms, :beds, :baths, :price, :rating, :image_url, :description)
  end
end
