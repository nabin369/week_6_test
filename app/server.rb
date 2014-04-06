require 'sinatra'
require 'data_mapper'
require 'database_cleaner'
require 'sinatra/partial'
require 'rack-flash'

require_relative './models/peep'
require_relative './models/user'
require_relative './helpers/application'
require_relative './data_mapper_setup'

require_relative './controllers/home'
require_relative './controllers/peep'
require_relative './controllers/user'
require_relative './controllers/sessions'

set :partial_template_engine, :erb

enable :sessions
set :session_secret, 'super secret'

use Rack::Flash
