class V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
end