class ItemController < ApplicationController

#  before do
#       require_login
#   end

  get '/items' do
    @items = Item.all
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
        redirect '/items'
      end
  end

  get '/items/:id' do
    @item = Item.find_by(id: params[:id])
    if @item
      @user = User.find(@recipe.user_id)
      erb :'items/show_item'
  else
     redirect "/items"
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
      @user = User.find(@item.user_id)
      if @item.user_id == current_user.id
        erb :"items/edit"
     else
        redirect "/items/#{@item.id}"
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
