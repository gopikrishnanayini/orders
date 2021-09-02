Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
    namespace :v1 do
    	resources :orders, :products
    	resources :carts do
    		 collection do
	          post :add_to_cart
	          delete :remove_from_cart
	        end
    	end
    end
   	end

end
