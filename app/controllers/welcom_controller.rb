class WelcomController < ApplicationController
  def index
    flash[:notice] = "Goodmoring!"
  end
end
