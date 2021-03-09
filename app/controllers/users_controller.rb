class UsersController < ApplicationController
  # Allow action ALSO if not connected :
  skip_before_action :only_signed_in, only: [:new, :create]
  # Allow action ONLY if not connected :
  before_action :only_signed_out, only: [:new, :create]

  # GET /users or /users.json
  def index
    # Use pagy for pagination ans SET number per page
    if helpers.isAdmin? 
        @pagy, @users = pagy(User.all, items:10)   
    else
      # Standard user are allowed to see users
      redirect_back(fallback_location:"/")
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /profil
  def profil
    # Available for the current_user profil
    @user = current_user
    render :edit
  end;

  # GET /users/1/edit
  def edit
    # Allow to edit users by admin only
    if helpers.isAdmin? 
      @user = User.find_by_id(params[:id]) 
    else 
      @user = current_user
    end 
  end

  # POST /users or /users.json
  def create
    # Define params required
    user_params = params.require(:user).permit(:username, :email, :password, :password_confirmation)
    @user = User.new(user_params)

    
    respond_to do |format|
      if @user.valid?
        if @user.save
          # Redirect to login page   
          format.html { redirect_to login_url, success: "User was successfully created." }
          #format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          #format.json { render json: @user.errors, status: :unprocessable_entity }
        end    
    else
      format.html { render :new, danger: "This username already exists !"}
    end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    puts '** Dans update...'
    #TOOD : Check if done by Profil or Admin !
    if helpers.isAdmin? 
      @user = User.find_by_id(params[:id]) 
    else
      @user = current_user
    end
    puts "Users : ", @user.inspect
    user_params = params.require(:user).permit(:username, :firstname, :lastname, :email, :role)
    respond_to do |format|
      if @user.update(user_params)
        #puts 'Update '
        if helpers.isAdmin? 
            format.html { redirect_to users_url, success: "User was successfully updated." }
        else
            format.html { redirect_to profil_url, success: "Your profil has been updated successfully." }
        end
        format.json { render :show, status: :ok, location: @user }
      else
        #puts 'Update echouée'
        format.html { render :edit, danger: "Problem during udpate."}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    puts '** Dans destroy...'
    # Define user to remove
    @user = User.find_by_id(params[:id]) 
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      #format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest, :firstname, :lastname)
    end
end
