class Booking < ApplicationRecord

    belongs_to :service

    belongs_to :bookee, class_name: :User

    belongs_to :booker, class_name: :User

    validates :bookee, presence: true

    validates :booker, presence: true

end
