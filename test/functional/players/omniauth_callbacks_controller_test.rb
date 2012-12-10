require 'test_helper'

class Players::OmniauthCallbacksControllerTest < ActionController::TestCase

  setup do
    request.env['devise.mapping'] = Devise.mappings[:player]
  end

  test "should create new player on github oauth" do
    
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

    assert_difference "Player.count" do
      get :github
    end

  end

  test "should log in existing player" do
    
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:existing]

    assert_difference("Player.count", 0) do
      get :github
    end

    assert @controller.player_signed_in?
  end

end