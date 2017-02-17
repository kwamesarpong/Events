class Message < ApplicationRecord

    belongs_to :mail_box

    belongs_to :recipient, class_name: :User

    belongs_to :sender, class_name: :User

    TWILIO_SID = "ACa669f908050e70ba81af4ec543db2bc7"

    AUTH_TOKEN = "f85aeacb2896d2ba38caa1d4cde88712"

    scope :sorted, lambda {order("messages.id DESC")}


    def self.check_communication_between? user_one, user_two
        mail_box_of_user_one = user_one.mail_box
        mail_box_of_user_one.messages.each do |message|
            if message.sender_id == user_two.id
                return true
                break
            end
       end
       return false
    end



end
