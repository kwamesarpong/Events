class OutsidesController < ApplicationController

    include ApplicationHelper

    def create
            auth = request.env['omniauth.auth']
            if @authorization = Authorization.find_by_provider_and_uid(auth.provider, auth.uid)
                #now sigin in user
                session[:user_id] = @authorization.user.id
                
                redirect_to '/'

            elsif @user = User.find_by_email(auth.info.email)
                #user email exist but different provider
                @authorization = Authorization.new
                @authorization.uid = auth.uid
                @authorization.provider = auth.provider
                @user.authorizations << @authorization
                session[:user_id] = @user.id

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
                display_object_attributes profile
                #redirect_to controller: :profiles, action: :new, from_there: profile.id
            end
            
            #session[:user_setting] = request.env['omniauth.auth']
            #puts request.env['omniauth.auth'].inspect
    end
end
