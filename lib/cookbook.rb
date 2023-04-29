require 'csv'
require_relative "recipe"

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = [] # array full what instances of Recipe
    load_csv
  end

  # Read ALL
  def all
    @recipes
  end

  # Create recipe
  def create(recipe) # recipe is an instance of Recipe
    @recipes << recipe
    save_csv
  end

  # Destroy a recipe
  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # row is an array of 2 strings (name and description)
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'w') do |csv| # csv is an object representing the csv file
      @recipes.each do |recipe|
        # we need to push arrays of strings inside the CSV file
        csv << [recipe.name, recipe.description]
      end
    end
  end
end