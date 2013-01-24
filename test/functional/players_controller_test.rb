require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  test "should put update" do
    sign_in players(:michiel)

    put :update, player: { git_repository_url: "meh" }, format: :js
    assert_response :success
  end

end
