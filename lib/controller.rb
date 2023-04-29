require_relative 'view'
require_relative 'scrape_allrecipes_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new 
  end

  def list
    # get the recipes from the cookbook (repo)
    recipes = @cookbook.all #returns an array of instances of Recipe
    # ask the view to display the recipes
    @view.display_recipes(recipes)
  end

  def create
    # ask (the view to ask) the user for a name
    # store name in a variable
    name = @view.ask_for :name 
    # ask the user for a description
    # store description in variable
    description = @view.ask_for :description 
    # ask the user for a rating
    # store rating in variable
    rating = @view.ask_for(:rating).to_f
    # create an instance of Recipe 
    recipe = Recipe.new(name: name, description: description, rating: rating)
    # give this instance to the cookbook for it to save our recipe
    @cookbook.create(recipe)
  end

  def destroy
    # list the recipes
    list
    # ask the user for the recipe to remove (index in the list)
    # store the user answer (make it an integer and subs 1)
    index = @view.ask_for(:index).to_i - 1
    # ask the cookbook to destroy the recipe
    @cookbook.destroy(index)
  end

  def import
    # 1. Ask user which ingredient to scrape
    # 2. Get and store the user choice
    ingredient = @view.ask_for(:ingredient)
    # 3. Scrape 5 recipes from the web
    recipes = ScrapeAllrecipes.new(ingredient).call
    # 4. Display recipes
    @view.display_recipes(recipes)
    # 5. Ask the user for an index (of the recieip she/he wants to add)
    # 6. Get user chosen index, convert it to integer and substract 1
    index = @view.ask_for(:index).to_i - 1
    # 7. Get recipe corresponding to the index in our list of 5 recipes
    recipe = recipes[index]
    # 8. Ask the cookbook to save it (@cookbook.create)
    @cookbook.create(recipe)
  end

  def mark_as_done
    # list the recipes
    list
    # Ask the user for a index
    index = @view.ask_for(:index).to_i - 1
    # Ask the cookbook to mark as done
    @cookbook.mark_as_done(index)
  end
end