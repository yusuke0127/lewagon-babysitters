class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation)
  end

  # def index_babysitter
  #   @reservations = Reservation.where(babysitter_id: params[:babysitter_id])
  # end

  def create
    @babysitter = Babysitter.find(params[:babysitter_id])
    # @user = User.find(@babysitter.user_id)
    @reservation = Reservation.new(reservation_params)
    @reservation.babysitter = @babysitter
    @reservation.user = current_user
    # @reservation.user = @user
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path
    else
      render 'babysitters/index'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :babysitter_id)
  end
end

