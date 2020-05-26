require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

configure do
    set :root, File.join(File.dirname(__FILE__), '..')
    set :views, File.join(root, "views")
    enable :sessions
    use Rack::Flash
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

  helpers do

def current_user
      @current_user ||= User.find(session[:user_id])
end

def logged_in?
      !!session[:user_id]
end

def require_login
    unless logged_in?
      redirect "/login"
    end
  end
end
end
