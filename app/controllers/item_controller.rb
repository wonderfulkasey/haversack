class ItemController < ApplicationController

  before do
       require_login
   end

  get '/items' do
    @items = Item.all
    @items = @items.sort_by{|item| item.title}
    erb :"items/index"
  end

  get '/items/new' do
      erb :'items/create_item'
  end

  post '/items' do
      @item = Item.new(params)
      @item.user_id = current_user.id

      if !@item.save
        current_user.items << @item
        redirect '/items/#{@item.id}'
      else
        redirect to('/items')
      end
  end

  get '/items/:id' do
    @item = Item.find_by(id: params[:id])
    if @item
      @user = User.find(@recipe.user_id)
      erb: 'items/show_item'
  else
     redirect "/items"
  end

get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    if @item.user_id == current_user.id
      erb :"items/edit"
   else
      redirect "/item/#{@item.id}"
    end
  end

  delete '/items/:id/delete' do
    @item = item.find(params[:id])
    if logged_in? && @item.user == current_user
      @item.destroy
      redirect to('/items')
    else
      redirect to('/login')
    end
  end


end
