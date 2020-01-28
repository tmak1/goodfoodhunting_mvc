require 'sinatra'
require 'sinatra/reloader' # shit

also_reload 'db/shared'
also_reload 'models/dish'

require 'pry'

require_relative 'db/shared'
require_relative 'models/dish'
# require_relative 'models/comment'
# require_relative 'models/venues'

get '/' do
  @dishes = all_dishes()
  erb :index
end

require_relative 'controllers/dishes_controller'
# require_relative 'controllers/comments_controller'
# require_relative 'controllers/venues_controller'




