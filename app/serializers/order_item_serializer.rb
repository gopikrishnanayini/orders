class OrderItemSerializer < ActiveModel::Serializer
  attributes :product_id, :name, :image, :description, :price, :quantity, :id

  def name
  	product.name
  end

  def image
  	product.image.url
  end

  def description
  	product.description
  end

  def price
  	product.price
  end

  def quantity
  	object.quantity
  end

  private

  def product
  	object.product
  end
end