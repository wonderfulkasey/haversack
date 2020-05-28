require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :root, File.join(File.dirname(__FILE__), '..')
    set :views, File.join(root, "views")
    set :raise_errors, false
    set :show_exceptions, false
    enable :sessions
    set :session_secret, "critrole"
    set :method_override, true
  end

  get "/" do
    if logged_in?
      redirect to('/items')
    else
      erb :welcome
    end
  end

  not_found do
    status 404
    erb :error
  end

  error do
    erb :error
  end

  helpers do
    def current_user
       @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
        session[:user_id]
    end

  end

end
