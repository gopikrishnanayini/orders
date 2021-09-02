module Products
	class CreateProduct < BaseInteractor

	  def call
	    product = Product.create(context.product_params)

	    if product.persisted?
	      context.product = product
	    else
	      context.fail!(errors: product.errors)
	    end
	  end
	end
end