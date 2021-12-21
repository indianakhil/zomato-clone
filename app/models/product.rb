class Product < ApplicationRecord

    has_many :line_items
    belongs_to :restaurant
    mount_uploader :image, ImageUploader

    attr_accessor :terms_accepted, :image
    # has_one_attached :image

    has_many :taggings
    has_many :tags, through: :taggings

    def self.tagged_with(name)
        Tag.find_by!(name: name).products
    end

    def self.tag_counts
        Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end

    def tag_list
        tags.map(&:name).join(', ')
    end

    def tag_list=(names)
        self.tags = names.split(',').map do |n|
        Tag.where(name: n.strip).first_or_create!
        end
    end

end
