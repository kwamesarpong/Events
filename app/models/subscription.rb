class Subscription < ApplicationRecord

    has_many :profiles

    validates :name, presence: true

    validates :amount, presence: true

    FREE = "FREE"

    PREMIUM = "PAID"

end
