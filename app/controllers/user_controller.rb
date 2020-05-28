class UserController < ApplicationController

 get '/signup' do
   if session[:user_id]
      erb :items
    else
      redirect "users/signup"
    end
  end

  post '/signup' do
    @user = User.new(params)
      if @user.save
        session[:user_id] = @user.id
        erb :items
      else
        redirect "/signup"
    end
  end

  get '/login' do
    if session[:user_id]
      erb :'items'
    else
      redirect "/login"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/items"
      else
        redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      @user = current_user
      @user = nil
      session.destroy
      redirect "/"
    else
      redirect "/"
    end
  end
end
