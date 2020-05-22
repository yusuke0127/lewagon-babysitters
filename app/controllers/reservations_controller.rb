class ReservationsController < ApplicationController
  skip_after_action :verify_authorized, only: :dashboard
  def index
    @reservations = policy_scope(Reservation)
    @past_reservations = current_user.reservations.where('end_time <= ?', DateTime.now)
  end

  # def index_babysitter
  #   @reservations = Reservation.where(babysitter_id: params[:babysitter_id])
  # end

  def dashboard
    @reservations = current_user.reservations_as_babysitter.where('reservations.end_time >= ?', DateTime.now)
    @past_reservations = current_user.reservations_as_babysitter.where('reservations.end_time <= ?', DateTime.now)
  end

  def create
    @babysitter = Babysitter.find(params[:babysitter_id])
    # @user = User.find(@babysitter.user_id)
    @reservation = Reservation.new(reservation_params)
    @reservation.babysitter = @babysitter
    @reservation.user = current_user
    # @reservation.user = @user
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path, notice: "Thank you for reserving. Please wait for the #{@babysitter.user.first_name}'s reply"
    else
      render 'babysitters/index'
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    if @reservation.update(reservation_params)
      redirect_to dashboard_path
    else
      render 'dashboard'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :babysitter_id, :status)
  end
end

