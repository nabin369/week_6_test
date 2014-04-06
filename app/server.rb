require 'sinatra'
require 'data_mapper'
require 'database_cleaner'
require 'sinatra/partial'

require_relative './models/peep'
require_relative './data_mapper_setup'

require_relative './controllers/home'
require_relative './controllers/peep'

set :partial_template_engine, :erb
