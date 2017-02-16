class OutsidesController < ApplicationController

    include ApplicationHelper

    layout "no_search"

    def create
            auth = request.env['omniauth.auth']
            if @authorization = Authorization.find_by_provider_and_uid(auth.provider, auth.uid)
                #now sigin in user
                session[:user_id] = @authorization.user.id

                redirect_after_oauth

            elsif @user = User.find_by_email(auth.info.email)
                #user email exist but different provider
                @authorization = Authorization.new
                @authorization.uid = auth.uid
                @authorization.provider = auth.provider
                @user.authorizations << @authorization
                session[:user_id] = @user.id

                redirect_after_oauth
                
            else
                #sign user_up
                @user = User.new
                @authorization = Authorization.new
                @user.name = auth.info.name
                @user.email = auth.info.email
                @user.kind = User::SERVICE_PROVIDER
                @authorization.uid = auth.uid
                @authorization.provider = auth.provider
                display_object_attributes @user
                display_object_attributes @authorization
                @user.password = "jhshjsfdhhs"
                unless @user.save!
                    display_errors_for_object @user
                end
                @user.authorizations << @authorization
                session[:user_id] = @user.id
                puts "######################"
                profile = Profile.new
                profile.user_id = @user.id
                profile.name_of_agency = "Name Of Agency"
                #make sure subcriptions are created beforehand
                profile.subscription_id = 1
                profile.desc = "A short description here"
                profile.paid = false
                profile.save
                mail_box = MailBox.new
                mail_box.user = @user
                mail_box.save
                display_object_attributes profile
                #redirect_to login screen and pass user id
                #from there we can update the password field
                redirect_to controller: :outsides, action: :finish_sign_up, from_there: @user.id
            end
            
            #session[:user_setting] = request.env['omniauth.auth']
            #puts request.env['omniauth.auth'].inspect
    end


    def finish_sign_up
        user_id = params[:from_there].to_i
        @user = User.find(user_id)
    end

    def finish_sign_up_from_outside
    end

    private

    def redirect_after_oauth
        @user = User.find(session[:user_id].to_i)
        if @user.kind == User::SERVICE_PROVIDER
            redirect_to controller: :profiles, action: :new, from_there: @user.profile.id
        else
            redirect_to '/'
        end
    end
    
end
