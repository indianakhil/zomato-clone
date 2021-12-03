class Restaurant < ApplicationRecord

    has_many :products
    belongs_to :user
    has_many :reviews
    
    mount_uploader :image, ImageUploader
end
