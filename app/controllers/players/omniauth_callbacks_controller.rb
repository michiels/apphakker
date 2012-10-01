class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    logger.info request.env['omniauth.auth']
    # player = Player.find_for_github_oauth(request.env['omniauth.auth'], current_player)

    # if user.persisted?
    #   sign_in_and_redirect user, :event => :authentication
    # else
    #   raise request.env['omniauth.auth']
    # end
  end

end