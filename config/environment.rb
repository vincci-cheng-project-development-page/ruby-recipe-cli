require 'bundler'
Bundler.require

require_relative '../recipe_app/recipe_database.rb'

DB = {:conn => SQLite3::Database.new("db/recipes.db")}
