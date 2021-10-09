class RecipeApp::Scraper
  BASE_URL = "https://www.bbcgoodfood.com"

  def get_page(url = BASE_URL+"/recipes/collection/all-time-top-20-recipes")
    uri = URI.parse(url)
    Nokogiri::HTML(uri.open)
  end

  def get_recipes
    doc = get_page
    puts "LOADING RECIPES"
    puts "This might take a few seconds..."
    sleep(7)

    #scrape all the recipes 
    items = doc.css('li.dynamic-list__list-item').map do |item|
      print "="
      title = item.css("h2.d-inline").text.strip
      image_url = item.css('img').attr('src')
      rating = item.css('div.rating').text.strip
      summary = item.css('p.d-block').text.strip
      url = item.css('a.d-block').attr("href").value
      doc = get_details_page url
      content_time = get_time doc
      content_difficulty = get_difficulty doc
      content_servings = get_servings doc
      content_ingredients = get_recipe_ingredients doc
      content_methods = get_recipe_methods doc

      {title: title, rating: rating, summary: summary, url: url, content_time: content_time, content_difficulty: content_difficulty, content_servings: content_servings, content_ingredients: content_ingredients, content_methods: content_methods, image_url: image_url}
    end

    make_items items
  end

  def get_details_page url
    item_url = url.include?(BASE_URL) ? url : "#{BASE_URL}#{url}"
    doc = get_page(item_url)
  end

  def get_time (doc)
    time_data = doc.css(".cook-and-prep-time .list-item").map{|n| "#{n.text}"}
    time_data
  end

  def get_difficulty (doc)
    difficulty_data = doc.css(".post-header__skill-level")
    difficulty_lines = difficulty_data.map{|n| "#{n.text}"}
    difficulty_lines.join(" ")
  end

  def get_servings (doc)
    servings_data = doc.css(".post-header__servings")
    servings_lines = servings_data.map{|n| "#{n.text}"}
    servings_lines.join("")
  end

  def get_recipe_ingredients(doc)
    recipe_ingredients_data = doc.css(".recipe__ingredients ul.list li")
    recipe_ingredients_lines = recipe_ingredients_data.collect(&:text)
    recipe_ingredients_lines
  end

  def get_recipe_methods(doc)
    recipe_methods_data = doc.css(".recipe__method-steps ul.grouped-list__list li")
    recipe_methods_lines = recipe_methods_data.collect(&:text)
    recipe_methods_lines
  end

  def make_items items
    items.map {|item| RecipeApp::Recipe.new item}
  end

end



