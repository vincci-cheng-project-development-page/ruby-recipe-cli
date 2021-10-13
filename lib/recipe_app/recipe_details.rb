class RecipeApp::Recipe_Details
  attr_accessor :url, :content_time_difficulty, :content_ingredients, :content_methods, :image_url, :content_servings, :content_difficulty, :content_time
  @@all = []

  def initialize url:, content_ingredients:, content_methods:, image_url:, content_servings:, content_difficulty:, content_time:
    @image_url = image_url
    @url = url
    @content_time = content_time
    @content_difficulty = content_difficulty
    @content_servings = content_servings
    @content_ingredients = content_ingredients
    @content_methods = content_methods

    @@all << self
  end

def print 
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
    puts "=======================INSTRUCTIONS:======================="
    puts ""
    puts "*~*~*~*~*~*~*~*~*~*~*~INGREDIENTS*~*~*~*~*~*~*~*~*~*~*~"
    puts ""
    puts content_ingredients
    puts ""
    puts "*~*~*~*~*~*~*~*~*~*~*~METHODS*~*~*~*~*~*~*~*~*~*~*~"
    puts ""
    puts content_methods
    puts ""
  end

  def self.item_contents
    @@all
  end
end