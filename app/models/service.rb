require 'file_size_validator'
class Service < ApplicationRecord

    include PgSearch

    multisearchable against: [:desc_service, :name_of_service]

    mount_uploader :picture, PictureUploader

    belongs_to :category

    belongs_to :profile

    has_many   :reviews

    has_many   :ratings

    has_many   :messages

    validates  :desc_service, presence: true
    
    validates  :price, presence: true, numericality: { only_integer: true } 

    validates  :picture, presence: true, file_size: { less_than_or_equal_to:  2.megabytes.to_i }


    scope :get_category_listings, lambda { |q| where(category_id: q) }


end
