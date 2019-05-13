class PagesController < ApplicationController
    def home
        @vehicles = Vehicle.where(user_id: current_user.id)
    end
end
