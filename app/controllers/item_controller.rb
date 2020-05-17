class ItemController < ApplicationController

  get '/items' do
    if logged_in?
    @items = Item.all
    redirect to('/items/index')
  else
 redirect to('/login')
  end
end

  get '/items/new' do
    if logged_in?
      @current_user
      redirect to('/items/create_item')
    else
 redirect to('/login')
  end
end

  post '/items' do
    if logged_in?
      @item = current_user.items.build(params)

      if !@item.save
        redirect to('/items/create_item')
      else
        redirect to('/login')
      end
  end

  get '/items/:id' do
    @item = Item.find_by(id: params[:id])
    if logged_in? && @item.user == current_user
      redirect to('/items/show_item')
  else
     redirect to('/login')
  end
end

  delete '/items/:id/delete' do
    @item = item.find(params[:id])
    if logged_in? && @expense.user == current_user
        @item.destroy
      redirect to('/items')
    else
      redirect to('/login')
    end
  end

  get '/items/:id/edit' do
      @item = Item.find(params[:id])
      if logged_in? && @item.user == current_user
      @item = Item.find(params [:id])
      @user = User.find(session[:user_id])
        redirect to(/"items/edit_item")
     else
        redirect to('/login')
      end
    end

  patch '/items/:id' do
    @item = Item.find(params[:id])
    @item.title = params[:title]
    @item.description = params[:description]
    @item.character = params[:character]

    if !@item.save
      @errors = @item.errors.full_messages
      redirect to('/item/edit_item')
    else
      redirect to("/items/#{@item.id}")
    end
  end
end
end
