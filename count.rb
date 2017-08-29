 def crust_price(crust)
        price = 0
    	session[:crust_choice.each do |crust_value, key| 
    		case crust_value
    	
    			when "Tiny"
    			price + 8
    			exit
  

    			when "Small"
    			price + 11
    			exit

    			when "Medium"
    			price + 13
    			exit

    			when "Large"
    			price + 14
    			exit

    			else
    			price + 0 
    			exit
    		end
   		 end 
    	crust_price
     p crust_price
     price.to_f
    end 