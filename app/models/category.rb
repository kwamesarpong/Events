class Category < ApplicationRecord

    include PgSearch

    multisearchable against: [:name, :description]

    mount_uploader :category_pic, CategoryPicUploader

    has_many :services
    
    has_many :subcategories

    validates :name, presence: true
end
