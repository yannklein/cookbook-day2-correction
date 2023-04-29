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

  def mark_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row) do |row|
      # row is a hash of 3 key/value (name:, description: and rating:)
      # row --> {"name" =>  'takoyaki', "description" =>  'tako and flour',"rating" =>  '4', 'done' => "true" }
      row["rating"] = row["rating"].to_f
      row["done"] = (row["done"] == "true")
      # row --> {"name" => 'takoyaki', "description" => 'tako and flour',"rating" => 4.0, 'done' => true}
      # p row
      @recipes << Recipe.new(row)
    end
    # p @recipes
  end

  def save_csv
    CSV.open(@csv_file_path, 'w') do |csv| # csv is an object representing the csv file
      csv << ['name', 'description', 'rating', 'done']
      @recipes.each do |recipe|
        # we need to push arrays of strings inside the CSV file
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?]
      end
    end
  end
end