ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

set :database_file, "./database.yml"
Dotenv.load if ENV['SINATRA_ENV'] == "development"

require './app/controllers/application_controller'
require './app/controllers/users_controller'
require './app/controllers/journal_entries_controller'
require_all 'app'
