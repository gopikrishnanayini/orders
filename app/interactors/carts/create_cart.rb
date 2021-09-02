module Carts
	class CreateCart < BaseInteractor

	  def call
	    cart = Cart.create(context.cart_params)

	    if cart.persisted?
	      context.cart = cart
	    else
	      context.fail!(errors: cart.errors)
	    end
	  end
	end
end