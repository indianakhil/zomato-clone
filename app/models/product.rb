class Product < ApplicationRecord

    has_many :line_items
    belongs_to :restaurant
    mount_uploader :image, ImageUploader

end
