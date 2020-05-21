class BabysittersController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    @users = policy_scope(Babysitter)
    if params[:address].present?
      @users = @users.near(params[:address])
    end

    @babysitters = Babysitter.where(user_id: @users.map(&:id))

    if params[:price_per_hour].present?
      @babysitters = @babysitters.where('price_per_hour <= ?', params[:price_per_hour])
    end
  end

  def show
    @reservation = Reservation.new
    @babysitter = Babysitter.find(params[:id])
    authorize @babysitter
  end

  def new

  end

  def create
    @babysitter = Babysitter.new
    @user = current_user
  end
end
