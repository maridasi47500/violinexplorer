class AudioController < ApplicationController
  protect_from_forgery except:[:save]
  def save
    @song=Song.find(params[:id])
    p params[:recording]
    
    if params[:micro] == "0"
    @recording=Recording.new(myparams)
    @song.recordings << @recording
    @vote=Vote.new
    else
    @recording=Talking.new(myparams)
    @song.talkings << @recording
    @vote=Vote.new

    end
    render layout: false


  end
  private
  def myparams
    params.permit(:recording,:mycontent,:accompaniment_id,:partonly)
  end
end
