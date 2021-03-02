class InterventionStatesController < ApplicationController
  before_action :set_intervention_state, only: %i[ show edit update destroy ]

  # GET /intervention_states or /intervention_states.json
  def index
    @intervention_states = InterventionState.all
  end

  # GET /intervention_states/1 or /intervention_states/1.json
  def show
  end

  # GET /intervention_states/new
  def new
    @intervention_state = InterventionState.new
  end

  # GET /intervention_states/1/edit
  def edit
  end

  # POST /intervention_states or /intervention_states.json
  def create
    @intervention_state = InterventionState.new(intervention_state_params)

    respond_to do |format|
      if @intervention_state.save
        format.html { redirect_to intervention_states_url, notice: "Intervention state was successfully created." }
        format.json { render :show, status: :created, location: @intervention_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intervention_states/1 or /intervention_states/1.json
  def update
    respond_to do |format|
      if @intervention_state.update(intervention_state_params)
        format.html { redirect_to intervention_states_url, notice: "Intervention state was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervention_states/1 or /intervention_states/1.json
  def destroy
    @intervention_state.destroy
    respond_to do |format|
      format.html { redirect_to intervention_states_url, notice: "Intervention state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention_state
      @intervention_state = InterventionState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_state_params
      params.require(:intervention_state).permit(:description)
    end
end
