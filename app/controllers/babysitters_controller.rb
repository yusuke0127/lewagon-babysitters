class BabysittersController < ApplicationController

  def index
    @babysitters = Babysitter.all
  end

  def show
    @reservation = Reservation.new
    @babysitter = Babysitter.find(params[:id])
  end
end
