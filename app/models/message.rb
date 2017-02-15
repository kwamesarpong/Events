class Message < ApplicationRecord

    belongs_to :mail_box

    TWILIO_SID = "ACa669f908050e70ba81af4ec543db2bc7"

    AUTH_TOKEN = "f85aeacb2896d2ba38caa1d4cde88712"

end
