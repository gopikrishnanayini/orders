class Api::V1::OrdersController < Api::V1::BaseController
	before_action :find_order, only: [:update, :destroy]

  def index
    list = params[:search_term].present? ? Order.search(params[:search_term]) : Order.all
    orders = list.page params[:page]
    render json: orders, status: 200, meta: pagination_details(orders)
  end

  def create
    res = Orders::CreateOrder.call(order_params: order_params, products: params["order"]["products"])
    if res.success?
      render json: res.order, status: 200
    else
      render json: { message: res.errors, type: :error }, status: :unprocessable_entity
    end
  end

  def update
    res = Orders::UpdateOrder.call(order: @order, order_params: order_params)
    if res.success?
      render json: res.order, status: 200
    else
      render json: { message: res.errors, type: :error }, status: :unprocessable_entity
    end
  end

	def destroy
		if @order.destroy
	    render json: @order, status: 200
	  else
	    render json: { message: @order.errors, type: :error }, status: :unprocessable_entity
	  end
	end

	private

	def order_params
		params.require(:order).permit(:name, :email, :phone_number, :order_number, :address_line1, :address_line2, :pincode, :state, :city, :place, :total_cost)
	end

	def send_email_notification(order, email)
		UserNotifier.send_email_to_buyer(email, order)
	end

	def find_order
		@order = Order.find(params[:id])
	end

end
