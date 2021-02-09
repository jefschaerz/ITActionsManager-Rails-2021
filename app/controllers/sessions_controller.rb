class SessionsController < ApplicationController
  # Allow action also if not connected :
  skip_before_action :only_signed_in, only: [:new, :create]
  
  def new
    puts '** We are in NEW SessionController'
  end

  def create
    puts '** We are in CREATE SessionController'
    # Check info provided to logon
    user_param = params.require(:user)
    @user = User.where(username: user_param[:username]).first
     
    # Check password
    if @user and @user.authenticate(user_param[:password])
    # Add info in session cookie
      session[:auth] = @user.to_session
      redirect_to users_path, success: "Connexion réussie"
    else
      redirect_to new_session_path, danger: 'Mauvais identifiant ou mot de passe'    
    end
  end

  def destroy
  end
end
