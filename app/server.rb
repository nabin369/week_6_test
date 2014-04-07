require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

# require 'database_cleaner'

require_relative './models/peep'
require_relative './models/user'
require_relative './helpers/application'
require_relative './data_mapper_setup'

require_relative './controllers/home'
require_relative './controllers/peep'
require_relative './controllers/user'
require_relative './controllers/sessions'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb
