class Profile < ApplicationRecord

    include PgSearch

    multisearchable against: [:name_of_agency, :tagline]

    mount_uploader :profile_picture, ProfilePictureUploader

    belongs_to :user

    belongs_to :subscription

    has_many   :services

    has_many   :locations

    has_many   :phone_numbers

    has_many   :addresses

    validates  :name_of_agency, presence: true

    validates  :desc, presence: true


end
