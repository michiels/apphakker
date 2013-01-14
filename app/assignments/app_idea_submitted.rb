class AppIdeaSubmitted

  def unlocked?(player)
    player.app_idea.present?
  end

end