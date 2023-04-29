require 'nokogiri'
require 'open-uri'
# require_relative 'recipe'

class ScrapeAllrecipes
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # your code here
    url = "https://www.allrecipes.com/search?q=#{@keyword}"
    doc = Nokogiri::HTML.parse(URI.open(url).read, nil, "utf-8")
    # initialize an empty array
    recipes = []
    # get the first 5 recipe cards, for each of them
    doc.search(".mntl-card-list-items")
      .select { |recipe_card| recipe_card.search('.mntl-recipe-star-rating').any? }
      .first(5)
      .each do |recipe_card|
      # retrieve the recipe URL
      recipe_url = recipe_card.attributes["href"].value
      # scrape the recipe webpage
      recipe_doc = Nokogiri::HTML.parse(URI.open(recipe_url).read, nil, "utf-8")
      # retrieve and store in var: 
        # 1. name
      title = recipe_doc.search("h1").text.strip
      # p title
        # 2. description
      description = recipe_doc.search(".article-subheading").text.strip
        # 3. rating
      rating = recipe_doc.search(".mntl-recipe-review-bar__rating").text.strip
        # 4. prep_time
      # create an instance of Recipe out of this info
      recipe = Recipe.new(name: title, description: description, rating: rating)
      # store the recipe in our array
      recipes << recipe
    end
    # return the array
    recipes
  end
end