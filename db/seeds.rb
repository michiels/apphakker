# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Assignment.find_or_create_by_ruby_class("GithubAccountCreated", :name => "GitHub account aangemaakt").save
Assignment.find_or_create_by_ruby_class("ApphakkerAccountCreated", :name => "Je bent officieel Apphakker geworden!").save

AssignmentSet.find_or_create_by_alias("setup", :name => "Beginnen met je applicatie").save