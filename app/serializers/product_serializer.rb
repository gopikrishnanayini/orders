class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :price, :quantity

  def image
  	object.image.url
  end
end