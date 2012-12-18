require "bundler/capistrano"

default_run_options[:pty] = true

set :application, "apphakker"
set :repository,  "git@github.com:michiels/apphakker.git"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "37.34.58.141", "app2.apphakker.nl"                          # Your HTTP server, Apache/etc
# role :app, "37.34.58.141", "app2.apphakker.nl"                       # This may be the same as your `Web` server
# role :db,  "37.34.58.141", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

role :web, "beta.apphakker.nl"
role :app, "beta.apphakker.nl"
role :db, "beta.apphakker.nl", :primary => true


set :user, "deploy"
set :scm, :git

set :bluepill, "bluepill"

# Uncomment the following two lines if you are testing with Vagrant
# set :bluepill, "/opt/vagrant_ruby/bin/bluepill"
# ssh_options[:port] = 2222
##

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

ssh_options[:forward_agent] = true

before "deploy:finalize_update" do
  run "rm -f #{release_path}/config/database.yml; ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "rm -f #{release_path}/log; ln -nfs #{shared_path}/log #{release_path}/log"
  run "mkdir -p #{shared_path}/dumps"
  run "mkdir #{release_path}/tmp;"
  run "ln -nfs #{shared_path}/pids #{release_path}/tmp/pids"
  run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
  run "ln -nfs #{shared_path}/../config/unicorn.rb #{release_path}/config/unicorn.rb"
end

namespace :db do
  task :pull do
    run "cd #{current_path} && bundle exec rake deploy:db:dump > #{shared_path}/dumps/database.sql"
    download "#{shared_path}/dumps/database.sql", "dump.sql"
    run "rm -f #{sared_path}/dumps/database.sql"
  end
end

namespace :db do
  task :push do
    upload "import.sql", "#{shared_path}/dumps/import.sql"
    run "cd #{current_path} && bundle exec rake deploy:db:import IMPORT_FILE=#{shared_path}/dumps/import.sql"
    run "rm -f #{shared_path}/dumps/import.sql"
  end
end

namespace :deploy do
  task :start do
    run "#{sudo} #{bluepill} load /etc/bluepill/#{application}.pill"
  end
  task :stop do
    run "#{sudo} #{bluepill} #{application} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{sudo} #{bluepill} #{application} restart"
  end
  task :status do
    run "#{sudo} #{bluepill} #{application} status"
  end
  task :seed do
    run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=production"
  end
end