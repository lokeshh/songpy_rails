class SongController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def search
  end
  
  def download
    path = Rails.root.join('app', 'helpers', 'songpy', 'songpy.py')
    redirect_to `python2 #{path} #{params[:name]}`
  end
end
