class Api::V1::CartsController < Api::V1::BaseController
	before_action :find_cart, only: [:update, :destroy]

  def index
    carts = Cart.all.page params[:page]
    render json: carts, status: 200, meta: pagination_details(carts)
  end

  def create
    res = Carts::CreateCart.call(cart_params: cart_params)
    if res.success?
      render json: res.cart, status: 200
    else
      render json: { message: res.errors, type: :error }, status: :unprocessable_entity
    end
  end

  def add_to_cart
  	product = Product.find(params[:product_id])
  	cart = Cart.find_by_email(params[:email])
  	res = Carts::AddProduct.call(product_id: product.id, cart: cart)
    if res.success?
      render json: res.cart_item, status: 200
    else
      render json: { message: res.errors, type: :error }, status: :unprocessable_entity
    end
  end

  def update
    res =Carts::UpdateCart.call(cart: @cart, cart_params: cart_params)
    if res.success?
      render json: res.cart, status: 200
    else
      render json: { message: res.errors, type: :error }, status: :unprocessable_entity
    end
  end

	def destroy
		if @cart.destroy
	    render json: @cart, status: 200
	  else
	    render json: { message: @cart.errors, type: :error }, status: :unprocessable_entity
	  end
	end

	def remove_from_cart
		product = Product.find(params[:product_id])
  	cart = Cart.find_by_email(params[:email])
  	cart_item = cart.cart_items.find_by(product_id: product.id)
  	if cart_item.destroy
	    render json: cart_item, status: 200
	  else
	    render json: { message: cart_item.errors, type: :error }, status: :unprocessable_entity
	  end
	end

	private


	def cart_params
		params.require(:cart).permit(:name, :email, :phone_number, :address_line1, :address_line2, :pincode, :state, :city, :place, :total_cost)
	end

	def find_cart
		@cart = Cart.find(params[:id])
	end

end