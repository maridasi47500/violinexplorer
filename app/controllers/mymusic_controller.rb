require 'assets/whattodo'

class MymusicController < ApplicationController
  def hello
       @songs = Radio.new.getallsongs
    console
  respond_to do |format|
    format.html  { render }
    format.js  { render }
  end

  end
end
