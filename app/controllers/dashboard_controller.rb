class DashboardController < ApplicationController
  before_filter :authenticate_player!

  def index

    @assignments = Assignment.all
  end
end
