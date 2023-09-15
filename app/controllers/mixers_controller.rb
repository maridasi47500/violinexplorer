class MixersController < ApplicationController
  layout "mixer"
  before_action :set_mixer, only: %i[ show edit update destroy ]

  # GET /mixers or /mixers.json
  def index
    @mixers = Mixer.all
  end

  # GET /mixers/1 or /mixers/1.json
  def show
  end

  # GET /mixers/new
  def new
    @mixer = Mixer.new
  end

  # GET /mixers/1/edit
  def edit
  end

  # POST /mixers or /mixers.json
  def create
    @mixer = Mixer.new(mixer_params)

    respond_to do |format|
      if @mixer.save
        format.html { redirect_to mixer_url(@mixer), notice: "Mixer was successfully created." }
        format.json { render :show, status: :created, location: @mixer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mixer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mixers/1 or /mixers/1.json
  def update
    respond_to do |format|
      if @mixer.update(mixer_params)
        format.html { redirect_to mixer_url(@mixer), notice: "Mixer was successfully updated." }
        format.json { render :show, status: :ok, location: @mixer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mixer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixers/1 or /mixers/1.json
  def destroy
    @mixer.destroy

    respond_to do |format|
      format.html { redirect_to mixers_url, notice: "Mixer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mixer
      @mixer = Mixer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mixer_params
      params.fetch(:mixer, {})
    end
end
