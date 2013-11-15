$:.unshift(File.expand_path('../../lib', __FILE__))

# Require Sinatra modules.
require 'sinatra'
require 'sinatra/advanced_routes'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'sinatra/contrib/all'

# Require assets.
require 'compass'
require 'slim'
require 'sass'
require 'coffee-script'
require 'v8'
require 'cgi'
require 'json'

# Require own libraries.
require 'asset_handler'

class ApplicationController < Sinatra::Base

  # Any global variables go in here.
  # AM_I_A_GLOBAL = 'yep'

  # Register Sinatra modules.
  register Sinatra::AdvancedRoutes
  register Sinatra::Flash
  register Sinatra::Partial
  register Sinatra::Contrib

  # Include any application-wide helpers.
  helpers ApplicationHelpers

  # Configurations.
  configure do

    # Sets needed variables.
    set :root, File.expand_path('../../', __FILE__)
    set :views, File.expand_path('../../views', __FILE__)
    set :partial_template_engine, :slim
    set :scss, { :style => :compact, :debug_info => true }

    # Compass configurations.
    Compass.add_project_configuration(File.join(settings.root, 'config', 'compass.rb'))

    # Enable needed behaviour.
    enable :sessions
    enable :method_override
    enable :partial_underscores

  end

  # Includes needed library files.
  use AssetHandler

  # Defines behaviour on 404.
  not_found{ slim :not_found }

end
