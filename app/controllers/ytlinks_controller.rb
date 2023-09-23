class YtlinksController < ApplicationController
  before_action :set_ytlink, only: %i[ show edit update destroy ]

  # GET /ytlinks or /ytlinks.json
  def index
    @ytlinks = Ytlink.all
  end

  # GET /ytlinks/1 or /ytlinks/1.json
  def show
  end

  # GET /ytlinks/new
  def new
    @ytlink = Ytlink.new
  end

  # GET /ytlinks/1/edit
  def edit
  end

  # POST /ytlinks or /ytlinks.json
  def create
    @ytlink = Ytlink.new(ytlink_params)

    respond_to do |format|
      if @ytlink.save
        format.html { redirect_to ytlink_url(@ytlink), notice: "Ytlink was successfully created." }
        format.json { render :show, status: :created, location: @ytlink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ytlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ytlinks/1 or /ytlinks/1.json
  def update
    respond_to do |format|
      if @ytlink.update(ytlink_params)
        format.html { redirect_to ytlink_url(@ytlink), notice: "Ytlink was successfully updated." }
        format.json { render :show, status: :ok, location: @ytlink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ytlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ytlinks/1 or /ytlinks/1.json
  def destroy
    @ytlink.destroy

    respond_to do |format|
      format.html { redirect_to ytlinks_url, notice: "Ytlink was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ytlink
      @ytlink = Ytlink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ytlink_params
      params.require(:ytlink).permit(:link, :song_id)
    end
end
