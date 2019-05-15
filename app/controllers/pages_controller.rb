class PagesController < ApplicationController
    def home
        if current_user
            if current_user.role.admin?
                redirect_to all_vehicles_path
            else
                redirect_to user_vehicles_path(current_user)
            end
        end
    end
end
