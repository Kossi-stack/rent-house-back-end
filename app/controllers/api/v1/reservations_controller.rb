class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: :destroy

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
    if @reservation.destroy
      render json: { message: 'Reservation deleted' }
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :house_id)
  end
end
