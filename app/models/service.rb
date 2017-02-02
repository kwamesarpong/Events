class Service < ApplicationRecord

    mount_uploader :picture, PictureUploader

    belongs_to :category

    belongs_to :profile

    has_many   :reviews

    validates  :desc_service, presence: true
    
    validates  :price, presence: true
end
