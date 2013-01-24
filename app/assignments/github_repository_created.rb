require 'grit'

class GithubRepositoryCreated

  def unlocked?(player)
    return false if player.git_repository_url.blank?
    tmp_repositories_url = "/tmp/repositories"
    checkout_path = File.join(tmp_repositories_url, player.id.to_s)

    FileUtils.mkdir_p(checkout_path)

    clone_command = "git clone \"#{player.git_repository_url.shellescape}\" #{checkout_path} 2>&1"
    output = `#{clone_command}`

    return $?.success?
  ensure
    FileUtils.rm_r(checkout_path)
  end

end