class Recipe
  attr_reader :name, :description, :rating
  def initialize(attributes = {})
    @name = attributes[:name] || attributes["name"]
    @description = attributes[:description] || attributes["description"]
    @rating = attributes[:rating] || attributes["rating"]
    @done = attributes[:done] || attributes["done"] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end