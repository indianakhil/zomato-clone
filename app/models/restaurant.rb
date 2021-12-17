class Restaurant < ApplicationRecord

    has_many :products
    belongs_to :user
    has_many :reviews
    # has_one_attached :image

    mount_uploader :image, ImageUploader
end
