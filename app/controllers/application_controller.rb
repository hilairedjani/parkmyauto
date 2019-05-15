class ApplicationController < ActionController::Base
    #Require auth for all pages
    before_action :authenticate_user!, except: [:home]

    # CHeck if role is set on login
    def after_sign_in_path_for(resource)
        # If user doesn't have a role, assign role: user
        unless Role.exists?(user_id: current_user.id)
            current_user.role = Role.create(role_name: 0)
        end
        root_path
    end
end
