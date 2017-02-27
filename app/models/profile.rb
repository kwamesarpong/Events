require 'file_size_validator'
class Profile < ApplicationRecord

    include PgSearch

    multisearchable against: [:name_of_agency, :tagline]

    mount_uploader :profile_picture, ProfilePictureUploader

    mount_uploader :banner, BannerUploader

    belongs_to :user

    belongs_to :subscription

    has_many   :services

    has_many   :locations

    has_many   :phone_numbers

    has_many   :addresses

    validates  :name_of_agency, presence: true

    validates  :desc, presence: true

    validates  :banner, file_size: { less_than_or_equal_to: 3.megabytes.to_i }

    validates  :profile_picture, file_size: { less_than_or_equal_to: 2.megabytes.to_i } 

end
