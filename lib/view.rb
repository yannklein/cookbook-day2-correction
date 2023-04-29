class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. [#{recipe.done? ? "X" : " "}] #{recipe.name}  - #{recipe.description[..30]} (#{recipe.rating}/5)"
    end
  end

  def ask_for(something)
    puts "What #{something} do you want?"
    gets.chomp
  end
end