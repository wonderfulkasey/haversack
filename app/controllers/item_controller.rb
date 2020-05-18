class ItemController < ApplicationController

  get '/items' do
    if logged_in?
      @items = current_user.items
      erb :'items/index'
    else
      redirect to('/login')
end
end

get '/items/:id/edit_item' do
  @item = Item.find(params[:id])
if logged_in? && @item.user == current_user
@item = Item.find(params[:id])
@user = User.find(@item.user_id)
if @item.user_id == current_user.id
erb :'items/edit_item'
else
redirect to('/items')
end
else
redirect to('/login')
end
end
end

patch '/items/:id' do
   @item = Item.find(params[:id])

    if @item.user_id == current_user.id
    @item.title = params[:title]
    @item.description = params[:description]
    @item.character = params[:character]

    if !@item.save
      @errors = @item.errors.full_messages
      redirect to("/items/#{expense.id}")

    else
      redirect "/recipes/#{@recipe.id}/edit"
    end
end

delete '/items/:id' do
  @item = Item.find(params[:id])
  @item.destroy
  redirect to("/items")
end

post '/items' do
    if logged_in?
      @item = Item.create(params["item"])
      redirect to("/items/#{@item.id}")
    else
      redirect to('/login')
    end
end

get '/items/new' do
   if logged_in?
     @current_user
     erb :'items/create_item'
   else
     redirect to('/login')
   end
end

get '/items/:id' do
   @item = Item.find_by(id:params[:id])
if logged_in? && @item.user == current_user
     erb :'items/show_item'

   else
     redirect to('/login')
   end
     end
