require "sinatra"
enable :session

get '/' do
erb :topping
end 

