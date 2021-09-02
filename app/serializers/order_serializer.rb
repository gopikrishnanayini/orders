class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :order_number, :address_line1, :address_line2, :pincode, :state, :city, :place, :total_cost

  has_many :order_items
end