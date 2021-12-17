class Product < ApplicationRecord

    has_many :line_items
    belongs_to :restaurant
    mount_uploader :image, ImageUploader

    attr_accessor :terms_accepted, :image
    # has_one_attached :image

end
