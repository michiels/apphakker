module DashboardHelper
  
  def player_avatar_url(player, size)
    hashed_email = Digest::MD5.hexdigest(player.email)
    return "http://gravatar.com/avatar/#{hashed_email}?s=#{size}"
  end

end
