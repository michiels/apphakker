class AssignmentSetsController < ApplicationController
  layout "dashboard"
  before_filter :authenticate_player!

  def show
    @assignment_set = AssignmentSet.find(params[:id])
  end

end
