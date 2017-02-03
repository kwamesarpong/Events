class Category < ApplicationRecord

    mount_uploader :category_pic, CategoryPicUploader

    has_many :services

    validates :name, presence: true
end
