require 'test_helper'

class AchievementsControllerTest < ActionController::TestCase

  test "claim should create a new achievement for a user" do
    user = players(:michiel)
    sign_in players(:michiel)

    assert_difference "user.achievements.count" do
      get :claim, :id => assignments(:github), :format => :js
    end

    assert_response :success
  end

end
