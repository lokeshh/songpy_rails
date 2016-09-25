require 'open-uri'

class SongController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def search
  end
  
  def download
    name = params[:name]
    video = !!params[:video]
    path = Rails.root.join('app', 'helpers', 'songpy', 'songpy.py')
    if video
      url = `python2 #{path} -v #{name}`
    else
      url = `python2 #{path} #{name}`
    end

    if url.empty?
      redirect_to '/'
    else
      data = open url
      send_data data.read, filename: "#{name}.webm", type: 'application/webm', disposition: 'inline'
    end
  end
end
