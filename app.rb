require "sinatra"
enable :sessions

get '/' do
erb :topping
end 

post '/all_tops' do 
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meat] = params[:meat]
	session[:veggie] = params[:veggie]
	session[:cheese] = params[:cheese]
	p params[:sauce]
	p params[:crust]
	redirect '/confirm'
end

get '/confirm' do 
	p params[:sauce]
	p params[:crust]
	erb :confirm, locals: {crust: session[:crust], sauce: session[:sauce], meat: session[:meat], veggie: session[:veggie], cheese: session[:cheese]}
end 

post '/confirm' do
    session[:crust_choice] = params[:crust_radio] 
    session[:sauce_choice] = params[:sauce_radio]
    session[:meat_choice] = params[:meat_radio]
    session[:veg_choice] = params[:veg_radio]
    session[:cheese_choice] = params[:cheese_radio]
    redirect '/results'
end