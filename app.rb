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
    p session[:sauce_choice]
   	price = 0
    price = price.to_f

    	session[:crust_choice].each do |crust_value, key| 
    		case crust_value
    	
    			when "Tiny"
    			price += 8
    		

    			when "Small"
    			price += 11
    			

    			when "Medium"
    			price += 13
    			

    			when "Large"
    			price += 14
    			

    			else
    			price += 0 
    			
    		end
    	end

    	session[:price_choice] = params[:price]
   	price = price.to_f
 	session[:price_choice] = price
 	p session[:price_choice]
 	pizza_tops = []
 	session[:pizza_tops]= pizza_tops
    session[:sub_total]= session[:sub_total] || 0	
    session[:big_pizza_array]= session[:big_pizza_array] || []
    redirect '/results'
end

get '/results' do


   	erb :results, locals: {big_array1: session[:big_pizza_array], pizza_tops1: session[:pizza_tops], crust1: session[:crust_choice], sauce1: session[:sauce_choice], meat1: session[:meat_choice], veggie1: session[:veggie_choice], cheese1: session[:cheese_choice], price: session[:price_choice], sub_total: session[:sub_total]}
end

post '/results' do 
this_pizza = params[:pizza_array]
p "#{this_pizza} hello"
session[:big_pizza_array] << this_pizza
session[:sub_total_1]= params[:sub_total]
redirect '/checkout'

end 

get '/checkout' do 

erb :checkout, locals: {sub_total: session[:sub_total_1], big_array: session[:big_pizza_array]}
end