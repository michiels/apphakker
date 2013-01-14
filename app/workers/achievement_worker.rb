class AchievementWorker
  include Sidekiq::Worker

  def perform(player_id, assignment_id)
    player = Player.find(player_id)
    assignment = Assignment.find(assignment_id)

    if assignment.unlocked?(player)
      player.assignments << assignment
    end
  end
end