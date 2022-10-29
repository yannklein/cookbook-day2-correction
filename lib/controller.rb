require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # ACTIONS

  # 1 - List all recipes
  def list
    # ask the cookbook all the recipes
    recipes = @cookbook.all
    # ask the view to display the recipes
    @view.display_recipes(recipes)
  end

  # 2 - Create a new recipe
  def create
    # ask the view to ask the user for a recipe name
    name = @view.ask_for :name
    # ask the view to ask the user for a recipe description
    description = @view.ask_for :description
    # create a Recipe instance
    recipe = Recipe.new(name, description)
    # ask the cookbook to store the recipe
    @cookbook.add_recipe(recipe)
    # list the recipes
    list
  end
  # 3 - Destroy a recipe
  def destroy
    # list the recipes
    list
    # ask the view to ask user for an index
    index = @view.ask_for(:index).to_i - 1
    # ask the cookbook to remove the recipe of this index
    @cookbook.remove_recipe(index)
    # list the recipes
    list
  end
end