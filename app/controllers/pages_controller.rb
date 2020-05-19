class PagesController < ApplicationController
  def home
  end

  def uidisplay
    @babysitter = Babysitter.new
  end
end
