module Carts
	class UpdateAgent < BaseInteractor

	  def call
	    cart = context.cart.update(context.cart_params)
	    if cart
	       context.cart = context.cart
	    else
	       context.fail!(errors: context.cart.errors.messages)
	    end
	  end
	end
end