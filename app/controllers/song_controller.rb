require 'open-uri'

class SongController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def search
  end
  
  def download
    path = Rails.root.join('app', 'helpers', 'songpy', 'songpy.py')
    url = `python2 #{path} #{params[:name]}`
    # debugger
    data = open url
    send_data data.read, filename: "#{params[:name]}.webm", type: 'application/webm', disposition: 'inline'
  end
end
