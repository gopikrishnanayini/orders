class CartSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :cart_items
end