require 'test_helper'

class GithubRepositoryCreatedTest < ActiveSupport::TestCase

  test "should return false on non existing repository" do
    player = players(:michiel)
    player.git_repository_url = '"; touch /tmp/hello; '
    validator = GithubRepositoryCreated.new

    assert !File.exists?('/tmp/hello')
    assert !validator.unlocked?(player)
  end

  test "should clone a repository" do
    player = players(:michiel)
    validator = GithubRepositoryCreated.new

    assert validator.unlocked?(player)
  end

end