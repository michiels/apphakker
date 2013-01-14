class PlayersController < ApplicationController
  before_filter :authenticate_player!

  respond_to :js

  def update
    @player = current_player

    @player.update_attributes(player_attributes)
  end

  private

  def player_attributes
    params.require(:player).permit(:app_idea, :git_repository_url)
  end
end
