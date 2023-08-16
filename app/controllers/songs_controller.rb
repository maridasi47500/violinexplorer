class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy myurl recordings vids]

  def myurl
    @k=1
    while Dir.glob("#{Rails.root.to_s}/public/uploads/**#{@song.myfilename}recording**").any?{|y|y.include?(@song.myfilename+"recording"+@k.to_s)} do
      @k+=1
    end
    `wget "#{params[:recording]}" -o "#{Rails.root.to_s}/public/uploads/#{@song.myfile}recording#{@k}.ogg"`
  end
  # GET /songs or /songs.json
  def index
    @songs = Song.page(params[:page]).numberrecordings
    @songsprecedent = Song.numberrecordings.precedent(params[:page])
    @songssuivant = Song.numberrecordings.suivant(params[:page])
    if params[:page].to_i <= 1
      params[:page]=nil
    end
      
    @recordings = Recording.recent
  end

  # GET /songs/1 or /songs/1.json
  def show
    if params[:my_devices] && params[:my_devices].length > 0
      session["my_devices"]||=[]
      session["my_devices"].push(params["my_devices"])
      @my_devices=session["my_devices"] 
      
    end
    if params[:my_devices_output] && params[:my_devices_output].length > 0
      session["my_devices"]||=[]
      session["my_devices"].push(params["my_devices_output"])
      @my_devices=session["my_devices"] 
      
    end
    @my_devices ||= []
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs or /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:artist, :title,:myfile,:myfile2,:myfile3)
    end
end
