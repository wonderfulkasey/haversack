require './config/environment'

class ApplicationController < Sinatra::Base

  enable :sessions

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :session_secret
    set :session_secret, "critrole"
  end

    get "/" do
          if logged_in?
            redirect to('/index')
          else
            erb :welcome
          end
        end

  helpers do

    def logged_in?
         !!session[:user_id]
       end


  def current_user
    @current_user ||= User.find(session[:user_id])
  end
        end

end
