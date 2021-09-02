class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :product_quantity, :product_price, :product_description, :product_image

  def product_name
  	product.name
  end

  def product_quantity
  	product.quantity
  end

  def product_price
  	product.price
  end

  def product_description
  	product.description
  end

  def product_image
  	product.image.url
  end

  private

  def product
  	object.product
  end
end