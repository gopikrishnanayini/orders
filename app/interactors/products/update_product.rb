module Products
	class UpdateProduct < BaseInteractor

	  def call
	    product = context.product.update(context.product_params)
	    if product
	       context.product = context.product
	    else
	       context.fail!(errors: context.product.errors.messages)
	    end
	  end
	end
end