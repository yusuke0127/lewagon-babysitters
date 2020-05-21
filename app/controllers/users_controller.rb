class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def update
    @babysitter = Babysitter.new
    @user = current_user
    @babysitter.user = @user
    @babysitter.save
    redirect_to user_path(@user)
    authorize @babysitter
  end
end
