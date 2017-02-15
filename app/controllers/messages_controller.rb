class MessagesController < ApplicationController

    def create
        body = params[:message][:body] #GET MESSAGE
        id = params[:id] #PULL THE PROFILE ID
        profile = Profile.find(id.to_i) #GET PROFILE OBJECT
        to = profile.user #GET CORRESPONDING USER OBJECT
        from = session[:user_id] #GET THE LOGGED IN USERS ID
        #NOW WE SEND THE MESSAGE
        message = Message.new #create THE MESSAGE OBJECT
        #SET REQUIREMENTS
        message.body = body
        message.recipient = to.id
        message.mail_box = to.mail_box
        message.sender = from
        #FIRE MESSAGE
        message.save
    end

    def inbox
        
    end

    def white_list
        params.require(:message).permit(:body)
    end
end
