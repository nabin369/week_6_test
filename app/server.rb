require 'sinatra'
require 'data_mapper'
# require 'capybara/rspec'
require 'rack-flash'
require 'sinatra/partial'

require_relative './models/peep'
require_relative './models/user'
require_relative './helpers/application'
require_relative './data_mapper'

require_relative './controllers/home.rb'
require_relative './controllers/message.rb'
require_relative './controllers/peep.rb'
require_relative './controllers/session.rb'
require_relative './controllers/user.rb'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb


