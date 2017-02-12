class Location < ApplicationRecord

    belongs_to :profile
    
    #multisearchable against: :phyiscal_location
end
