require 'nokogiri'
require 'open-uri'

class RecipeApp::CLI

  def initialize
    RecipeApp::Scraper.new.get_recipes  
  end

  def start
    system("clear")
    puts "Welcome to my Recipe CLI App"
    new_line
    puts "Do you want to view the available recipes?"
    puts "Input [y] for YES"
    puts "Enter any character to EXIT"
    
    input = gets.strip.downcase
    input == "y" ? list_items : exit
  end

  def list_items
    system("clear")
    puts "Recipes Available:"
    new_line
    print_divider

    RecipeApp::Recipe.item_contents.each.with_index(1) do |item, i|
      puts "#{i}. #{item.title}"
    end
    prompt_item_selection
  end
  def print_divider
    puts "================================================="
  end

  def new_line
    puts ""
  end

  def prompt_item_selection
    new_line
    print_divider
    puts "Please enter the number of the recipe to view more details:"
    puts "Input any other character to exit"
    input = get_user_input
    input == 0 ? exit : print_recipe_details(input)
  end

  def get_user_input
    input = gets.strip.to_i
    if input > 20
      puts "Invalid input: number is greater than the number of items available."
      puts "Please input a valid number."
      return get_user_input
    end
    input 
  end

  def print_recipe_details input
    system("clear")
    RecipeApp::Recipe.item_contents[input-1].print
  prompt_user_general
end

  def prompt_user_general
    new_line
    print_divider
    puts "Input [list] to view go back the the index of recipes"
    puts "Input any character to exit"

    input = gets.strip.downcase

    input == "list" ? list_items : exit
  end
end
