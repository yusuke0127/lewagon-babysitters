class BabysittersController < ApplicationController

  def index
    @babysitters = Babysitter.all
  end

  def show
    @babysitter = Babysitter.find(params[:id])
  end
end
