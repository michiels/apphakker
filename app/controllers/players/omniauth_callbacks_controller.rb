class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    auth_info = request.env['omniauth.auth']

    player = Player.find_or_initialize_by_provider_and_uid(auth_info.provider, auth_info.uid)
    player.name = auth_info.extra.raw_info.name
    player.email ||= auth_info.extra.raw_info.email

    if player.save
      sign_in_and_redirect :player, player, :event => :authentication
    else
      session['devise.github_data'] = request.env['omniauth.auth']
      redirect_to new_player_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end