class AudioController < ApplicationController
  protect_from_forgery except:[:save]
  def save
    @song=Song.find(params[:id])
    p params[:recording]
    @song.recordings << Recording.new(myparams)
    
  end
  private
  def myparams
    params.permit(:recording,:mycontent)
  end
end
