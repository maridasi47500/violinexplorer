class MicsController < ApplicationController
  before_action :set_mic, only: %i[ show edit update destroy ]

  # GET /mics or /mics.json
  def index
    @mics = Mic.all
  end

  # GET /mics/1 or /mics/1.json
  def show
  end

  # GET /mics/new
  def new
    @mic = Mic.new
  end

  # GET /mics/1/edit
  def edit
  end

  # POST /mics or /mics.json
  def create
    @mic = Mic.new(mic_params)

    respond_to do |format|
      if @mic.save
        format.html { redirect_to mic_url(@mic), notice: "Mic was successfully created." }
        format.json { render :show, status: :created, location: @mic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mics/1 or /mics/1.json
  def update
    respond_to do |format|
      if @mic.update(mic_params)
        format.html { redirect_to mic_url(@mic), notice: "Mic was successfully updated." }
        format.json { render :show, status: :ok, location: @mic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mics/1 or /mics/1.json
  def destroy
    @mic.destroy

    respond_to do |format|
      format.html { redirect_to mics_url, notice: "Mic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mic
      @mic = Mic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mic_params
      params.fetch(:mic, {})
    end
end
