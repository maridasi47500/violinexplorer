class VideoController < ApplicationController
  protect_from_forgery except:[:save]
  def save
    @song=Song.find(params[:id])
    p params[:recording]
    @song.videos << Video.new(myparams)

  end
  private
  def myparams
    params.permit(:recording,:mycontent)
  end

end
