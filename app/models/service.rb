class Service < ApplicationRecord

    include PgSearch

    multisearchable against: [:desc_service]

    mount_uploader :picture, PictureUploader

    belongs_to :category

    belongs_to :profile

    has_many   :reviews

    has_many   :ratings

    validates  :desc_service, presence: true
    
    validates  :price, presence: true
end
