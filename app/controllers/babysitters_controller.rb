class BabysittersController < ApplicationController

  def index
    @babysitters = policy_scope(Babysitter)
  end

  def show
    @reservation = Reservation.new
    @babysitter = Babysitter.find(params[:id])
    authorize @babysitter
  end
end
