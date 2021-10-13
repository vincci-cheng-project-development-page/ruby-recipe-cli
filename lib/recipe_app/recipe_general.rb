class RecipeApp::Recipe_General
  attr_accessor :title, :summary, :rating
  @@all = []

  def initialize title:, rating:, summary:
    @title = title
    @rating = rating
    @summary = summary

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
    puts rating
    puts ""
  end

  def self.item_contents
    @@all
  end
end