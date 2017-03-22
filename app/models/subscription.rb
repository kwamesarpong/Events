class Subscription < ApplicationRecord

    has_many :profiles

    validates :name, presence: true

    validates :amount, presence: true

    FREE = "FREE"

    PREMIUM = "PAID"

    ERROR = "You have reached your limit for the FREE TIER, move to the PREMIUM TIER"

end
