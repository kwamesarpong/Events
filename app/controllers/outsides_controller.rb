class OutsidesController < ApplicationController

    include ApplicationHelper

    def create
            @user = User.new
            auth = request.env['omniauth.auth']
            @user.uid = auth.uid
            @user.providers = auth.provider
            @user.name = auth.info.name
            @user.email = auth.info.email
            @user.kind = User::SERVICE_PROVIDER
            display_object_attributes @user
            @user.password = "jhshjsfdhhs"
            unless @user.save!
                display_errors_for_object @user
            end
            #session[:user_id] = @user.id
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
            #end
            
            #session[:user_setting] = request.env['omniauth.auth']
            #puts request.env['omniauth.auth'].inspect
    end
end
