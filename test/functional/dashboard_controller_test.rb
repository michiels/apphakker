require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    sign_in players(:michiel)

    get :index
    assert_response :success

    assert_not_nil assigns(:assignments)
  end
end
