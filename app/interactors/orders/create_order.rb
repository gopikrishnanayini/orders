module Orders
	class CreateOrder < BaseInteractor

	  def call
	    order = Order.create(context.order_params)

	    if order.persisted?
	      context.order = order
	      context.products.each do |product|
      	  order.order_items.create(product_id: product['id'], quantity: product['quantity'])
      	end if context.products.present?	
	    else
	      context.fail!(errors: order.errors)
	    end
	  end
	end
end