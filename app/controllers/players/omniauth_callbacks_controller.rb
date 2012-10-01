class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    auth_info = request.env['omniauth.auth']

    player = Player.find_or_initialize_by_provider_and_uid(auth_info.provider, auth_info.uid)
    player.name = auth_info.info.name
    player.email = auth_info.info.email
    player.save!

    if player.persisted?
      sign_in_and_redirect player, :event => :authentication
    else
      raise request.env['omniauth.auth']
    end
  end

end