class Api::V1::ReservationsController < ApplicationController
    def index
      @reservations = current_user.reservations
      render json: @reservations
    end
end  