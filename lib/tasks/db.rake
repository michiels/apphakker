namespace :db do
  desc "Exports the database to a file dump.sql"
  task :dump do
    db_info = YAML::load( File.open("config/database.yml") )
    system "mysqldump -h #{db_info['host']} --password=#{db_info['password']} -u #{db_info['username']} #{db_info['database']} > dump.sql"
  end
end