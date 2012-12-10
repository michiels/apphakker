class SessionsController < ApplicationController
  def destroy
    sign_out(current_player)
    redirect_to root_url
  end
end
