require_relative 'view'

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
    # create an instance of Recipe 
    recipe = Recipe.new(name, description)
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

end