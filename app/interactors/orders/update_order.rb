module Orders
	class UpdateOrder < BaseInteractor

	  def call
	    order = context.order.update(context.order_params)
	    if order
	       context.order = context.order
	    else
	       context.fail!(errors: context.order.errors.messages)
	    end
	  end
	end
end