class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  # To filter
  has_scope :search
  has_scope :search_query
  has_scope :sorted_by

  # GET /interventions or /interventions.json
  def index
    # Load also other informaion in order to be able to display info in the list (and not only id) 
    # Use pagy
    puts "In index..."
  
    @pagy, @interventions = pagy(apply_scopes(Intervention.includes(:device, :intervention_type, :user, :intervention_state)),items:10)
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
    # Create list of state to use in view
    @statustypes = InterventionState.select(:id, :description).distinct
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    puts 'Params :', intervention_params.inspect   

    #Add user value (connected)
    @intervention.user_id = current_user.id
    puts 'Interventions :', @intervention.inspect
    
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to interventions_url, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to interventions_url, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    # Use helpers in controller, but not recommended
    if helpers.isAdmin?
        @intervention.destroy
        respond_to do |format|
        format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
        format.json { head :no_content }
        end
    else
        respond_to do |format|
        format.html { redirect_to interventions_url, danger: "You have not the permission to do this action." }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:date, :summary, :details, :state, :device_id, :intervention_type_id, :intervention_state_id, :user_id)
    end
end
