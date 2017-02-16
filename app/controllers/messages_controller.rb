class MessagesController < ApplicationController


    skip_before_action :verify_authenticity_token, only: :update

    def create
        body = params[:body] #GET MESSAGE
        id = params[:id] #PULL THE PROFILE ID
        profile = Profile.find(id.to_i) #GET PROFILE OBJECT
        to = profile.user #GET CORRESPONDING USER OBJECT
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
            message.save
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
        params.require(:message).permit(:id, :body)
    end
end
