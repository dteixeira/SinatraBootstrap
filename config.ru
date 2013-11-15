require 'sinatra/base'

# Include every Ruby file in the project.
Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

# Map route prefixes to specific controllers.
map('/') { run MainController }
