class AchievementsController < ApplicationController
  before_filter :authenticate_player!

  def claim
    @assignment = Assignment.find(params[:id])

    if @assignment.unlocked?
      current_player.assignments << @assignment
      render
    else
      render :nothing => true
    end
  end

end
