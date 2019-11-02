require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') 
  end

  get "/" do
    erb :index
  end

  helpers do
  
    def current_user(session)
      @current_user ||= User.find_by_id(session[:user_id])
    end
    
    def logged_in?(session)
      !!current_user
    end 
  end

end
