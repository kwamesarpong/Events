module ApplicationHelper

    #this method is for purely object testing
    def display_object_attributes object
        object.attributes.each do |attr_name, attr_value|
            puts "#{attr_name} is #{attr_value}"
        end
    end


    #dispalying errors on view
    def display_errors_for_object object
        unless object.errors.full_messages.blank?
            object.errors.full_messages.each do |message|
            render(partial: 'application/error_messages', locals: {message: message})
            end
        end
    end


    #dispalying success

    def display_success flash_hash_notice
        render(partial: 'application/success_messages', locals: {flash_hash_notice: flash_hash_notice})
    end

    def display_service_posted_success flash_hash_notice
        render(partial: 'application/service_success_messages', locals: {flash_hash_notice: flash_hash_notice})
    end


end
