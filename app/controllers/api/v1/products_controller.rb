class Api::V1::ProductsController < Api::V1::BaseController
	before_action :find_product, only: [:update, :destroy]

  def index
    list = params[:search_term].present? ? product.search(params[:search_term]) : Product.all
    products = list.page params[:page]
    render json: products, status: 200, meta: pagination_details(products)
  end

  def create
    res = Products::CreateProduct.call(product_params: product_params)
    if res.success?
      render json: res.product, status: 200
    else
      render json: { message: res.errors, type: :error }, status: :unprocessable_entity
    end
  end

  def update
    res = Products::UpdateProduct.call(product: @product, product_params: product_params)
    if res.success?
      render json: res.product, status: 200
    else
      render json: { message: res.errors, type: :error }, status: :unprocessable_entity
    end
  end

	def destroy
		if @product.destroy
	    render json: @product, status: 200
	  else
	    render json: { message: @product.errors, type: :error }, status: :unprocessable_entity
	  end
	end

	private

	def product_params
		params.require(:product).permit(:name, :image, :description, :price, :quantity)
	end

	def find_product
		@product = Product.find(params[:id])
	end

end