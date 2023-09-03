class AudioController < ApplicationController
  protect_from_forgery except:[:save]
  def save
    @song=Song.find(params[:id])
    p params[:recording]
    
    @recording=Recording.new(myparams)
    @song.recordings << @recording
    @vote=Vote.new
    render layout: false
  end
  private
  def myparams
    params.permit(:recording,:mycontent,:accompaniment_id,:partonly)
  end
end
