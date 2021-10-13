# frozen_string_literal: true
require 'open-uri'
require 'nokogiri'
require_relative "recipe_app/version"
require_relative "recipe_app/cli"
require_relative "recipe_app/recipe"
require_relative "recipe_app/scraper"


module RecipeApp
  class Error < StandardError; end
  # Your code goes here...
end
