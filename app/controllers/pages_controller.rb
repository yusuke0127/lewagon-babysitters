class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only:[:home]

  def home
  end

  def show
    @user = current.user
  end

  def uidisplay
    @babysitter = Babysitter.new
  end
end
