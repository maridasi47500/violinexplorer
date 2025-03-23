class MymessagesController < ApplicationController
  before_action :set_mymessage, only: %i[ show edit update destroy ]

  # GET /mymessages or /mymessages.json
  def index
    @mymessages = Mymessage.all
  end

  # GET /mymessages/1 or /mymessages/1.json
  def show
  end

  # GET /mymessages/new
  def new
    @mymessage = Mymessage.new
  end

  # GET /mymessages/1/edit
  def edit
  end

  # POST /mymessages or /mymessages.json
  def create
    @mymessage = Mymessage.new(mymessage_params)

    respond_to do |format|
      if @mymessage.save
        format.html { redirect_to mymessage_url(@mymessage), notice: "Mymessage was successfully created." }
        format.json { render :show, status: :created, location: @mymessage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mymessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mymessages/1 or /mymessages/1.json
  def update
    respond_to do |format|
      if @mymessage.update(mymessage_params)
        format.html { redirect_to mymessage_url(@mymessage), notice: "Mymessage was successfully updated." }
        format.json { render :show, status: :ok, location: @mymessage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mymessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mymessages/1 or /mymessages/1.json
  def destroy
    @mymessage.destroy

    respond_to do |format|
      format.html { redirect_to mymessages_url, notice: "Mymessage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mymessage
      @mymessage = Mymessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mymessage_params
      params.require(:mymessage).permit(:content, :user_id)
    end
end
