class ItemController < ApplicationController

#  before do
#       require_login
#   end

  get '/items' do
    if logged_in?
    @items = Item.all
    erb :'items/index'

  else

  end

  get '/items/new' do
    if logged_in?
      erb :'items/create_item'
    else

  end

  post '/items' do
    if logged_in?
      @item.user_id = current_user.items.build(params)

      if !@item.save
        current_user.items << @item
        erb :'/items/create_item'
      else
        redirect to ('/items')
      end
    else
      redirect to ('/login')
  end

  get '/items/:id' do
    @item = Item.find_by(id: params[:id])
    if logged_in? && @item.user == current_user
      erb :'items/show_item'
  else
     redirect ("/login")
  end
end

  delete '/items/:id=' do
    @item = item.find(params[:id])

    if recipe.user_id == current_user.id
        @item.destroy
      redirect to('/items')
    end
  end

  get '/items/:id/edit' do
      @item = Item.find(params[:id])
      if logged_in? && @item.user == current_user
      @item = Item.find(params [:id])
      @user = User.find(session[:user_id])
        erb :"items/edit"
     else
        redirect to('/login')
      end
    end

  patch '/items/:id' do
    @item = Item.find(params[:id])

    if @recipe.user_id == current_user.id
    @item.title = params[:title]
    @item.description = params[:description]
    @item.character = params[:character]

    if !@item.save
      @errors = @item.errors.full_messages
      redirect "/items/#{@item.id}/edit_item"
    else
      redirect "/items/#{@item.id}/edit_item"
    end
  end
end
end
