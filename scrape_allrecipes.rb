require "nokogiri"
require "open-uri"
require_relative "lib/recipe.rb"

# Create a method to scrape the following for 5 recipes info:
# 1. name
# 2. description
# 3. rating
# 4. prep_time
# And return an array of 5 Recipe instances
def scrape_allrecipes(keyword)
  # your code here
  url = "https://www.allrecipes.com/search?q=#{keyword}"
  doc = Nokogiri::HTML.parse(URI.open(url).read, nil, "utf-8")
  # initialize an empty array
  recipes = []
  # get the first 5 recipe cards, for each of them
  doc.search(".mntl-card-list-items").first(5).each do |recipe_card|
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
      # 4. prep_time
    # create an instance of Recipe out of this info
    recipe = Recipe.new(title, description)
    # store the recipe in our array
    recipes << recipe
  end
  # return the array
  recipes
end

p scrape_allrecipes("strawberry")