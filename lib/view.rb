class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "[#{index + 1}] #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for(something)
    puts "Give me a #{something}"
    gets.chomp
  end
end