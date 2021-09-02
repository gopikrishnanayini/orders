class Order < ApplicationRecord
	include PgSearch::Model
	has_many :order_items
	paginates_per 10
	validates_format_of :phone_number, :with => /^(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}$/,
    :message => "Please enter valid phone number." ,:multiline => true
  	validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
