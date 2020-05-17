class UserController < ApplicationController

#  before do
      #   require_login
     #end

 get '/signup' do
    if !session[:user_id]
      erb :'users/signup'
    else
      redirect to('/items')
    end
  end

  post '/signup' do
    @user = User.new(params)
    if !@user.save
      @errors = @user.errors.full_messages
      erb :'users/signup'
    else
      session[:user_id] = @user.id
      redirect to('/items')
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect to('/items')
    end
  end

  post '/login' do
    @User = User.find_by(username: params[:username])

      if @user && @user.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      redirect '/items'
    else
      @errors = "Invalid username or password."
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to('/')
    else
      redirect to('/')
    end
  end

end
