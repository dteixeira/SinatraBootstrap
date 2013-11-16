require 'sinatra/base'

# Require needed Ruby files.
Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

# Map route prefixes to specific controllers.
map('/') { run MainController }
