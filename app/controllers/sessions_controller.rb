class SessionsController < ApplicationController
  # Allow action also if not connected :
  skip_before_action :only_signed_in, only: [:new, :create]
  def new
  end

  def create
    # Check info providedto logon
    user_param = params.require(:user)
    @user = User.where(username: user_params[:username]).first
     redirect_to users_path, success: "Connexion réussie"
    # Check password
    if @user and @user.authenticate(user_params[:password])
    # Add info in session cookie
      session[:auth] = @user.to_session
      redirect_to users_path, success: "Connexion réussie"
    else
      redirect_to new_user_path, danger: 'Mauvais identifiant ou mot de passe'    
    end
  end

  def destroy
  end
end
