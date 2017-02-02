class Review < ApplicationRecord
    belongs_to :service

    belongs_to :user

    validates  :message, presence: true

    validates  :co_efficient, presence: true
end
