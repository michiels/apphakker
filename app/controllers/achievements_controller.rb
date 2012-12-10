class AchievementsController < ApplicationController

  def claim
    @assignment = Assignment.find(params[:id])

    if @assignment.unlocked?
      render
    else
      render :nothing => true
    end
    # create a method to check if the achievement validates for the current user
    # and is not validated yet
  end

end
