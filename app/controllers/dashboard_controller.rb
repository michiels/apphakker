class DashboardController < ApplicationController
  layout "dashboard"
  before_filter :authenticate_player!

  def index
    @achieved_assignments = current_player.assignments.starter
    @assignments = Assignment.starter.reject { |a| @achieved_assignments.include?(a) }

    respond_to do |format|
      format.html
      format.js { render "assignment_sets/show"}
    end
  end
end
