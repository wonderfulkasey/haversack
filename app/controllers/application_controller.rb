require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure :development do
      set :session_secret, 'only_for_development'
    end

    configure :production do
      set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    end

    get "/" do
          if logged_in?
            redirect to('/index')
          else
            erb :welcome
          end
        end

  helpers do


  def current_user
    @current_user ||= User.find(session[:user_id])
  end

          def logged_in?
               !!session[:user_id]
             end


        end

end
