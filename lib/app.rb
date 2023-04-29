require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'recipes.csv')
# p csv_file
# similar to csv_file = "./recipes.csv"

cookbook   = Cookbook.new(csv_file)
# p 'cookbook', cookbook
controller = Controller.new(cookbook)
# p 'controller', controller
router = Router.new(controller)

# Start the app
router.run
