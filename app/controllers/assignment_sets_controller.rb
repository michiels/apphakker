class AssignmentSetsController < ApplicationController
  layout "dashboard"
  before_filter :authenticate_player!

  def show
    @assignment_set = AssignmentSet.find(params[:id])
    @achieved_assignments = @assignment_set.assignments & current_player.assignments
    @assignments = @assignment_set.assignments - @achieved_assignments
  end

end
