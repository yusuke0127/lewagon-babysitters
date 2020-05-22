class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    raise
    @babysitter.find()
  end

  def update
    if @babysitter
      @babysitter = Babysitter.find(params[:babysitter_id])
    else
      @babysitter = Babysitter.new
    end
    @user = current_user
    @babysitter.user = @user
    authorize @babysitter
    if @babysitter.save
      redirect_to user_path(@user)
    else
        render 'devise/registrations/edit'
    end
  end
end
