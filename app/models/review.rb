class Review < ApplicationRecord

    belongs_to :service

    belongs_to :user

    validates  :message, presence: true


    before_save :co_efficient


    private

    def co_efficient
        #determine co_efficient between 0 and 4.5
    end

end
