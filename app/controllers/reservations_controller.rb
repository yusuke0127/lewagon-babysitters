class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def index_babysitter
    @reservations = Reservation.where(params[:babysitter_id])
  end
end
