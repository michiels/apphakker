namespace :deploy do

  namespace :db do
    desc "Exports the database to a file dump.sql"
    task :dump do
      databases = YAML::load( File.open(Rails.root.join('config', 'database.yml')) )
      db_info = databases["production"]
      system "mysqldump -h #{db_info['host']} --password=#{db_info['password']} -u #{db_info['username']} #{db_info['database']}"
    end

    desc "Imports the database from import.sql"
    task :import do
      databases = YAML::load( File.open(Rails.root.join('config', 'database.yml')) )
      db_info = databases["production"]
      system "mysql -h #{db_info['host']} --password=#{db_info['password']} -u #{db_info['username']} #{db_info['database']} < #{ENV['IMPORT_FILE']}"
    end
  end
  
end