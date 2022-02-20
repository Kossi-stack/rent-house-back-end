class Api::V1::ReservationsController < ApplicationController
    def index
      @reservations = current_user.reservations
      render json: @reservations
    end
    def create
        @reservation = current_user.reservations.new(reservation_params)
        if @reservation.save
          render json: @reservation
        else
          render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        render json: @reservation
    end    
end  