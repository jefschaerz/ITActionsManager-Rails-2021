class ApplicationController < ActionController::Base
    include Pagy::Backend

    # By default user must be signed in to do something
    before_action :only_signed_in
    add_flash_types :success, :danger
    
    # Define Helper
    helper_method :current_user, :user_signed_in?
    
    private
    # Check if user is signed and if not redirect to login
    def only_signed_in
        if !user_signed_in?
            redirect_to new_session_path, danger: "Vous devez être connecté pour cette action !"
        end
    end

    # Define is a user is disconnected using session
    def only_signed_out
        if user_signed_in?
            redirect_to profil_path if user_signed_in?
        end
    end

    # Check if a user signed in
    def user_signed_in?
        !current_user.nil?
    end
    
    # Return current user logged in
    def current_user       
        return nil if !session[:auth] || !session[:auth]['id']
        # Avoid multiple request
        return @current_user if @current_user
        # find by_id will return nil if not found and no exception
        @current_user = User.find_by_id(session[:auth]['id'])
    end
end
