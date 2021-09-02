module Carts
	class AddProduct < BaseInteractor

	  def call
	  	if context.cart.present?
	    	cart_item = context.cart.cart_items.create(product_id: context.product_id)
	    	 if cart_item.persisted?
		      context.cart_item = cart_item
		    else
		      context.fail!(errors: cart_item.errors)
		    end
	    else
		    context.fail!(errors: 'cart doesnot exists')
		end
	  end
	end
end