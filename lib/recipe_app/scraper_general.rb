class RecipeApp::Scraper_Details
  BASE_URL = "https://www.bbcgoodfood.com"

  def get_page(url = BASE_URL+"/recipes/collection/all-time-top-20-recipes")
    uri = URI.parse(url)
    Nokogiri::HTML(uri.open)
  end

  def get_recipes
    doc = get_page

    #scrape all the recipes 
    items = doc.css('li.dynamic-list__list-item').map do |item|
      print "="
      title = item.css("h2.d-inline").text.strip
      rating = item.css('div.rating').text.strip
      summary = item.css('p.d-block').text.strip

      {title: title, rating: rating, summary: summary}
    end

    make_items items
  end

  def make_items itemZ
    itemZ.map {|it| RecipeApp::Recipe_General.new it}
  end

end



