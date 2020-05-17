class ItemController < ApplicationController

  before do
    redirect '/' unless logged_in?
  end

  get '/items' do
    @title = 'Items'
    erb :'items/index'
end

  get '/items/new' do
   @title = 'New Item'
   erb :'items/create_item'
end

  post '/items' do

end

  get '/items/:id' do
    @item = Item.find_by_id(params[:item_id])
    if item && item.user_id == session[:user_id]
      erb :'items/index'
  else
     redirect to('/items')
  end
end

  get '/items/:id/edit' do
      @item = Item.find(params[:id])
      if logged_in? && @item.user == current_user
      @item = Item.find(params [:id])
      @user = User.find(session[:user_id])
        redirect to('/items/edit_item')
     else
        redirect to('/login')
      end
    end


delete '/items/:id/delete' do
  @item = Item.find_by_id(params[:id])

  if item && item.user_id == session[:user_id]
      item.destroy
    redirect to('/items')
  else
    redirect to('/')
  end
end


end
