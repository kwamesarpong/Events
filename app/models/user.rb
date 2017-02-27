class User < ApplicationRecord

    has_secure_password

    has_one  :profile

    has_many :reviews

    has_many :authorizations

    has_many :bookings

    has_one  :mail_box

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    EMAIL_MESSAGE = "Please provide an correct email address with more than 5 characters"

    USER_MESSAGE_UNIQUE = "Username already taken"

    USER_MESSAGE_LENGTH = "Username must be between 5 to 25 characters"

    PASSWORD_MESSAGE = "Password must be at least 5 characters long and must include a number"

    SERVICE_PROVIDER = "Service Provider"

    ORGANIZER = "Organizer"

    validates :email, presence: { message: EMAIL_MESSAGE }, uniqueness: { message: EMAIL_MESSAGE, case_sensitive: false }, length: { within: 5...100 }, format: EMAIL_REGEX

    #validates :password, presence: { message: PASSWORD_MESSAGE } , length: { minimum: 5, message: PASSWORD_MESSAGE }, confirmation: true

    validates :kind, presence: true


    enum kind: ["Service Provider", :Organizer]

end
