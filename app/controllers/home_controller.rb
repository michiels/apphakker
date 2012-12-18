class HomeController < ApplicationController

  def index
    if player_signed_in?
      redirect_to dashboard_url
    end
  end
end
