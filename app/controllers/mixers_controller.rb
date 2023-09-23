class MixersController < ApplicationController
  before_action :set_mixer, only: %i[ show edit update destroy ]
  layout "hello"

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
    @mics={}
    1.upto(12).each do |t|
      @mics[t]=@mixer.mics.new(nb:t)
    end

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
      params.require(:mixer).permit(:ctrf_room_out_l, :ctrl_room_out_r, :_2tr_out_r, :_2tr_out_l, :_2tr_in_r, :_2tr_in_l, :main_out_l, :main_out_r, :phones, :fx_send, :phantom, :fx_send_value, :_2tr_to_ctrl_room, :_2tr_to_mix, :fx_to_ctrl_room, :phones_value, :main_mix_value, :song_id)
    end
end
