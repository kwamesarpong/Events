class Subscription < ApplicationRecord

    has_many :profiles

    validates :name, presence: true

    validates :amount, presence: true

    FREE = 1

    PREMIUM = 2

    ERROR = "You have reached your limit for the FREE TIER, move to the PREMIUM TIER"



    #check if a user is a PREMIUM user
    def self.is_premium? profile
        if profile.subscription_id == PREMIUM
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
        if is_premium? profile
            profile.subscription.expiry_date = 30.days.from_now
            if profile.save!
                true
            else
                false
            end
        end
    end

    #change a user from FREE to PREMIUM
    def self.change_tier? profile, new_tier
        unless is_premium? profile
            profile.subscription_id = new_tier
            profile.paid = true
            renew? profile
        end 
            
        
    end

end
