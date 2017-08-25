require "sinatra"
enable :sessions

get '/' do
erb :topping
end 

get '/topping' do
erb :topping
end

post '/all_tops' do 
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meat] = params[:meat]
	session[:veggie] = params[:veggie]
	session[:cheese] = params[:cheese]
	if session[:crust] == nil 
		session[:crust] = Array["No Crust"] 
	end 
	
	if session[:sauce] == nil 
		session[:sauce] = Array["No Sauce"] 
	end 	

	if session[:meat] == nil 
		session[:meat] = Array["No Meat"] 
	end 

	if session[:veggie] == nil 
		session[:veggie] = Array["No Veggie"] 
	end 

	if session[:cheese] == nil 
		session[:cheese] = Array["No Cheese"] 
	end 

	redirect '/confirm'
end

get '/confirm' do 
	erb :confirm, locals: {crust: session[:crust], sauce: session[:sauce], meat: session[:meat], veggie: session[:veggie], cheese: session[:cheese]}
end 


post '/confirm' do
	session[:crust_choice] = params[:crust_radio]
    session[:sauce_choice] = params[:sauce_radio] 
    session[:meat_choice] = params[:meat_radio]
    session[:veggie_choice] = params[:veggie_radio]
    session[:cheese_choice] = params[:cheese_radio]
    session[:price_choice] = params[:price]
    def crust_price
    	case session[:crust_choice]
    	when "Tiny"
    	when "Medium"
    	when "Large"

    def price_method
    	price = price.to_f
    end 
    redirect '/results'
end

get '/results' do


   	erb :results, locals: {crust1: session[:crust_choice], sauce1: session[:sauce_choice], meat1: session[:meat_choice], veggie1: session[:veggie_choice], cheese1: session[:cheese_choice]}
end

post '/results' do 

end 