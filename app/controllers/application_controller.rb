class ApplicationController < ActionController::Base

    before_action :only_signed_in
    add_flash_types :success, :danger

    # Function to define is a user is connected using session
    private
    
    def only_signed_in
        if !session[:auth] || !session[:auth]['i']
            redirect_to new_user_path, danger: "Vous devez être connecté pour cette action !"
        end
    end
end
