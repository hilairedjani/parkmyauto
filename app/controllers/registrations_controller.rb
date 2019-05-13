class RegistrationsController < Devise::RegistrationsController
    private
        def sign_up_params
            params.require(:user).permit(
                :first_name,
                :last_name,
                :email,
                :password,
                :password_confirmation,
                :street_address,
                :city,
                :province,
                :postal_code,
                :telephone_number
            )
        end

        def account_update_params
            params.require(:user).permit(
                :first_name,
                :last_name,
                :email,
                :password,
                :password_confirmation,
                :street_address,
                :city,
                :province,
                :postal_code,
                :telephone_number
            )
        end
end