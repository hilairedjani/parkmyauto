class PagesController < ApplicationController
    def home
        if current_user
            redirect_to user_vehicles_path(current_user)
        end
    end
end
