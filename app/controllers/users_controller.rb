class UsersController < ApplicationController
  def show
    @user = current_user
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
    if @babysitter.save
      redirect_to user_path(@user)
    else
        render 'devise/registrations/edit'
    end
    authorize @babysitter
  end
end
