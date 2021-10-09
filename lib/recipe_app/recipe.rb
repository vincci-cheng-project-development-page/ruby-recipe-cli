class RecipeApp::Recipe
  attr_accessor :title, :summary, :url, :rating, :content_time_difficulty, :content_ingredients, :content_methods, :image_url, :content_servings, :content_difficulty, :content_time
  @@all = []

  def initialize title:, rating:, summary:, url:, content_ingredients:, content_methods:, image_url:, content_servings:, content_difficulty:, content_time:
    @title = title
    @image_url = image_url
    @rating = rating
    @summary = summary
    @url = url
    @content_time = content_time
    @content_difficulty = content_difficulty
    @content_servings = content_servings
    @content_ingredients = content_ingredients
    @content_methods = content_methods

    @@all << self
  end

def print 
    system("clear")
    puts ""
    puts "===================================================================================="
    puts "===================================================================================="
    puts ""
    puts "-----------------------RECIPE NAME: #{title}-----------------------"
    puts ""
    puts summary
    puts ""
    puts "Duration:"
    puts content_time
    puts ""
    puts "Difficulty: #{content_difficulty}"
    puts ""
    puts "Servings: #{content_servings}"
    puts ""
    puts rating
    puts ""
    puts "URL: https://www.bbcgoodfood.com#{url}"
    puts "IMAGE URL: #{image_url}"
    puts ""
    puts "=======================INSTRUCTIONS:======================="
    puts ""
    puts "-----------------------INGREDIENTS-----------------------"
    puts ""
    puts content_ingredients
    puts ""
    puts "-----------------------METHODS-----------------------"
    puts ""
    puts content_methods
    puts ""
    puts ""
  end

  def self.item_contents
    @@all
  end
end