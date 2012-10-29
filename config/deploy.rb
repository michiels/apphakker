require "bundler/capistrano"

default_run_options[:pty] = true

set :application, "apphakker"
set :repository,  "git@github.com:michiels/apphakker.git"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "37.34.58.141"                          # Your HTTP server, Apache/etc
role :app, "37.34.58.141"                          # This may be the same as your `Web` server
role :db,  "37.34.58.141", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, "deploy"
set :use_sudo, false
set :scm, :git

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

ssh_options[:forward_agent] = true

before "deploy:finalize_update" do
  run "rm -f #{release_path}/config/database.yml; ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "rm -f #{release_path}/log; ln -nfs #{shared_path}/log #{release_path}/log"
  run "mkdir #{release_path}/tmp;"
  run "ln -nfs #{shared_path}/pids #{release_path}/tmp/pids"
  run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
  run "ln -nfs #{shared_path}/../config/unicorn.rb #{release_path}/config/unicorn.rb"
end

namespace :deploy do
  task :start do
    run "sudo bluepill load /etc/bluepill/#{application}.pill"
  end
  task :stop do
    run "sudo bluepill #{application} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo bluepill #{application} restart"
  end
end

# # If you are using Passenger mod_rails uncomment this:
# namespace :deploy do

#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end