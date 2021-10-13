class RecipeApp::Recipe
  attr_accessor :title, :summary, :rating, :url, :content_ingredients, :content_methods, :image_url, :content_servings, :content_difficulty, :content_time
  @@all = []

  def initialize title:, rating:, summary:, url:, content_ingredients:, content_methods:, image_url:, content_servings:, content_difficulty:, content_time:
    @image_url = image_url
    @url = url
    @content_time = content_time
    @content_difficulty = content_difficulty
    @content_servings = content_servings
    @content_ingredients = content_ingredients
    @content_methods = content_methods
    @title = title
    @rating = rating
    @summary = summary

    @@all << self
  end

def print_recipe 
    system("clear")
    puts ""
    puts "===================================================================================="
    puts "===================================================================================="
    puts ""
    puts "-----------------------RECIPE NAME: #{title}-----------------------"
    puts ""
    puts summary
    puts ""
    puts rating
    puts ""
    puts "Duration:"
    puts content_time
    puts ""
    puts "Difficulty: #{content_difficulty}"
    puts ""
    puts "Servings: #{content_servings}"
    puts ""
    puts "URL: https://www.bbcgoodfood.com#{url}"
    puts "IMAGE URL: #{image_url}"
    puts ""
  end

  def print_ingredients
        puts "*~*~*~*~*~*~*~*~*~*~*~INGREDIENTS*~*~*~*~*~*~*~*~*~*~*~"
    puts ""
    puts content_ingredients
    puts ""
  end

  def print_instructions
    puts "*~*~*~*~*~*~*~*~*~*~*~METHODS*~*~*~*~*~*~*~*~*~*~*~"
    puts ""
    puts content_methods
    puts ""
  end

  def self.item_contents
    @@all
  end
end