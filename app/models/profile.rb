class Profile < ApplicationRecord

    mount_uploader :profile_picture, ProfilePictureUploader

    belongs_to :user

    belongs_to :subscription

    has_many   :services

    validates :name_of_agency, presence: true

    validates :desc, presence: true


end
