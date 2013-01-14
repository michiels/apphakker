class AchievementsController < ApplicationController
  before_filter :authenticate_player!

  def claim
    @assignment = Assignment.find(params[:id])
    @assignment_set = @assignment.assignment_set

    if @assignment_set.nil?
      @achieved_assignments = current_player.assignments.starter
      @assignments = Assignment.starter.reject { |a| @achieved_assignments.include?(a) }
    else
      @achieved_assignments = @assignment_set.assignments & current_player.assignments
      @assignments = @assignment_set.assignments - @achieved_assignments
    end

    render

    AchievementWorker.perform_async(current_player.id, @assignment.id)
  end

end
