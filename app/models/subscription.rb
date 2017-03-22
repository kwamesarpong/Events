class Subscription < ApplicationRecord

    has_many :profiles

    validates :name, presence: true

    validates :amount, presence: true

    FREE = "Standard"

    BEST = "Best"

    BUSINESS = "Business"

    ERROR = "You have reached your limit for the FREE TIER, move to the PREMIUM TIER"



    #check if a user is a PREMIUM user
    def self.is_paid? profile
        if profile.subscription.name == BEST || profile.subscription.name == BUSINESS
            true
        end
    end


    #check if the user's expiry_date is close so we can send a pop up
    def self.check_expiry_date_close? subscription
        if subscription.recurring && Date.today >= ( subscription.expiry_date - 10.days ) 
                true
            else
                false
        end
    end

    #rew a subscription
    def self.renew? profile
        if is_paid? profile
            profile.subscription.expiry_date = 30.days.from_now
            if profile.save!
                true
            else
                false
            end
        end
    end

    #change a user from FREE to PREMIUM
    def self.change_tier profile, new_tier
        profile.subscription = Subscription.find_by_name(new_tier)
        profile.paid = true
        renew? profile     
    end


    #check if subscription is expiried
    def self.expiried? profile, subscription
        if subscription.recurring && Date.today > subscription.expiry_date
                change_tier profile, FREE
            else
                false
        end
    end
end
