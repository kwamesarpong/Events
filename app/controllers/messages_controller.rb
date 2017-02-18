class MessagesController < ApplicationController

    include ApplicationHelper

    skip_before_action :verify_authenticity_token, only: [:update, :create]

    def create 
        body = params[:message][:body] #GET MESSAGE
        id = params[:message][:profile_id] #PULL THE PROFILE ID
        profile = Profile.find(id.to_i) #GET PROFILE OBJECT
        to = profile.user #GET CORRESPONDING USER OBJECT
        puts to.mail_box
        from = session[:user_id] #GET THE LOGGED IN USERS ID
        #NOW WE SEND THE MESSAGE
        message = Message.new #create THE MESSAGE OBJECT
        #SET REQUIREMENTS
        message.body = body
        message.recipient = to
        message.mail_box = to.mail_box
        message.read = false
        begin
            message.sender = User.find(from.to_i)
            if message.save
                render json: message
            else
                render json: message
            end
            #display_object_attributes(message)
        rescue ActiveRecord::RecordNotFound
            redirect_to controller: :users, action: :new
        end
    end

    def inbox
        
    end

    def update
        message = Message.find(params[:id])
        message.read = true
        message.save
    end

    
    
    private

    def white_list
        params.require(:message).permit(:id, :body, :profile_id)
    end
end
