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
    input == "y" ? menu_index : exit
  end

  def menu_index
    system("clear")
    puts "Recipes Available:"
    new_line
    print_divider_style_2

    RecipeApp::Recipe.item_contents.each.with_index(1) do |item, i|
      puts "#{i}. #{item.title}"
    end
    prompt_item_selection
  end
  def new_line
    puts ""
  end
  def print_divider
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
  end
  def print_divider_style_2
    puts "===================================================================================="
  end


  def prompt_item_selection
    new_line
    print_divider_style_2
    new_line
    puts "Please enter the number of the recipe on the menu to view more details:"
    puts "Input any other character to exit"
    input = get_user_input
    input == 0 ? exit : print_recipe_details(input)
  end

  def get_user_input
    input = gets.strip.to_i
    if input > 20
      puts "Invalid input: number is greater than the number of items on the menu."
      puts "Please input a valid number."
      return get_user_input
    end
    input 
  end

  def print_recipe_details input
    system("clear")
    RecipeApp::Recipe.item_contents[input-1].print_recipe
    prompt_user_general(input)
  end


  def prompt_user_general input
    puts "=======================OPTIONS:======================="
    puts "Enter [index] to go back to the index of recipes"
    puts "Enter [what] to see the ingredients for this recipe"
    puts "Enter [how] to see the instructions for this recipe"
    option = gets.strip.downcase
    if option === "index" 
      menu_index
    elsif option === "what"
      print_recipe_ingredients(input)
    elsif option === "how"
      print_recipe_instructions(input)
    end
  end

  def prompt_recipe_ingredients input
    puts "=======================OPTIONS:======================="
    puts "Enter [yum] to go back to this recipe's general information"
    puts "Enter [how] to see the instructions for this recipe"
    puts "Enter any other character to exit"
    option = gets.strip.downcase
    if option === "yum" 
      print_recipe_details(input)
    elsif option === "how"
      print_recipe_instructions(input)
    else
      exit
    end
  end

  def print_recipe_ingredients input
    RecipeApp::Recipe.item_contents[input-1].print_ingredients
    puts ""
    puts ""
    prompt_recipe_ingredients(input)
  end

  def prompt_recipe_instructions input
    puts "Enter [yum] to go back to this recipe's general information"
    puts "Enter [what] to see the ingredients for this recipe"
    puts "Enter any other character to exit."
    puts ""
    option = gets.strip.downcase
    if option === "yum" 
      print_recipe_details(input)
    elsif option === "what"
      print_recipe_ingredients(input)
    else
      exit
    end
  end

  def print_recipe_instructions input
    RecipeApp::Recipe.item_contents[input-1].print_instructions
    puts ""
    puts ""
    prompt_recipe_instructions(input)
  end
end
