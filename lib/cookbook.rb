require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  ### CRUD

  # CREATE
  def add_recipe(new_recipe)
    @recipes << new_recipe
    save_csv
  end

  # READ
  def all
    @recipes
  end

  # UPDATE (pass this time!)

  # DELETE
  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # row is an array of strings
      # we want to store an instance of Recipe in @recipes
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # @recipes is an array of instances of Recipe
      @recipes.each do |recipe|
        # recipe is an instance of Recipe
        # we want to insert arrays of 2 strings (name, description) in our CSV file
        csv << [recipe.name, recipe.description]
      end
    end
  end
end