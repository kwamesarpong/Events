module ApplicationHelper

    #this method is for purely object testing
    def display_object_attributes(object)
        object.attributes.each do |attr_name, attr_value|
            puts "#{attr_name} is #{attr_value}"
        end
    end


    #dispalying errors on view
    def display_errors_for_object(object)
        unless object.errors.full_messages.blank?
            object.errors.full_messages.each do |message|
                return message
            end
        end
    end


end
