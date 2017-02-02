class Service < ApplicationRecord
    belongs_to :category

    belongs_to :profile

    has_many   :reviews

    validates  :desc_price, presence: true
    
    validates  :price, presence: true
end
