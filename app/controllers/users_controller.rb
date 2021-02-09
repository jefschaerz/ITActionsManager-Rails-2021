class UsersController < ApplicationController
  # Allow action also if not connected :
  skip_before_action :only_signed_in, only: [:new, :create, :index]
  before_action :only_signed_out, only: [:new, :create, :confirm]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # Allow to edit current users only
    puts '** Dans edit...'
    @user = current_user
  end

  # POST /users or /users.json
  def create
    # Define params required
    user_params = params.require(:user).permit(:username, :email, :password, :password_confirmation)
    @user = User.new(user_params)

    if @user.valid?
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, success: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { render :new }
    end
    
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    puts '** Dans update...'
    @user = current_user
    user_params = params.require(:user).permit(:username, :firstname, :lastname, :email)
    respond_to do |format|
      if @user.update(user_params)
        puts 'Update réalisé'
        format.html { redirect_to profil_path, success: "User was successfully updated." }
        #format.json { render :show, status: :ok, location: @user }
      else
        puts 'Update echouée'
        format.html { render :edit, danger: "Problem during udpate."}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest, :firstname, :lastname)
    end
end
