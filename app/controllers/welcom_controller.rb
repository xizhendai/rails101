class WelcomController < ApplicationController
  def index
    flash[:notice] = "Goodmoring!"
    flash[:alert] = "Goodnight!"
  end
end
