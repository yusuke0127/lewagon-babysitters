class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation)
  end

  def index_babysitter
    @reservations = Reservation.where(params[:babysitter_id])
  end
end

