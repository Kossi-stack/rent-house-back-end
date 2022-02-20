class Api::V1::HousesController < ApplicationController
    def index
      @houses = House.all
      render json: @houses
    end
    def create
        @house = current_user.houses.new(house_params)
        if @house.save
          render json: @house
        else
          render json: { errors: @house.errors.full_messages }, status: :unprocessable_entity
        end
    end    
end