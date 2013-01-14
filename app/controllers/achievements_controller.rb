class AchievementsController < ApplicationController
  before_filter :authenticate_player!

  def claim
    @assignment = Assignment.find(params[:id])

    if @assignment.unlocked?(current_player)
      current_player.assignments << @assignment

      if current_player.assignments.starter.count == Assignment.starter.count
        @all_completed = true
      end
      render
    else
      render :nothing => true
    end
  end

end
