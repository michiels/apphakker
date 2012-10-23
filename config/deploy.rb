require "bundler/capistrano"

default_run_options[:pty] = true

set :application, "apphakker"
set :repository,  "git://github.com/michiels/apphakker.git"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, "deploy"
set :use_sudo, false
set :scm, :git

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

ssh_options[:port] = 2222

after "deploy:update_code" do
  run "rm #{release_path}/config/database.yml; ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end