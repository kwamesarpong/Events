class Message < ApplicationRecord

    belongs_to :mail_box

    belongs_to :recipient, class_name: :User

    belongs_to :sender, class_name: :User

    TWILIO_SID = "ACa669f908050e70ba81af4ec543db2bc7"

    AUTH_TOKEN = "f85aeacb2896d2ba38caa1d4cde88712"

    scope :sorted, lambda {order("messages.id DESC")}



end
