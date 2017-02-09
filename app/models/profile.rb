class Profile < ApplicationRecord

    include PgSearch

    multisearchable against: [:name_of_agency, :tagline]

    mount_uploader :profile_picture, ProfilePictureUploader

    belongs_to :user

    belongs_to :subscription

    has_many   :services

    has_many   :address_books

    validates  :name_of_agency, presence: true, uniqueness: true

    validates  :desc, presence: true


end
