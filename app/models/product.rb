class Product < ApplicationRecord
	mount_uploader :image, AvatarUploader
	has_many :order_items
	paginates_per 10
	include PgSearch::Model

  private

  def avatar_size_validation
  	errors.add(:image, 'should be less than 3MB') if image.size > 3.megabytes
  end
end
