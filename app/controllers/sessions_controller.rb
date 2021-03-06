class SessionsController < ApplicationController
  # Allow action also if not connected :
  skip_before_action :only_signed_in, only: [:new, :create]
  # Allow to create session only if not yet signed-in
  before_action :only_signed_out, only: [:new, :create]
  
  def new
    puts '** We are in NEW SessionController'
  end

  def create
    puts '** We are in CREATE SessionController'
    # Check info provided to logon
    user_param = params.require(:user)
    @user = User.where(username: user_param[:username]).first
    puts @user.inspect 
    # Check password
    if @user and @user.authenticate(user_param[:password])
    # Add info in session cookie
      session[:auth] = @user.to_session
      redirect_to interventions_path, success: "Connection succeed"
    else
      redirect_to new_session_path, danger: 'Bad username or password'    
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path, success: 'You are successfully connected'
  end
end
