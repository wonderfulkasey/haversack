class ItemController < ApplicationController

  get '/items' do
      @items = Item.all
      erb :'items/index'
end

get '/items/:id/edit_item' do
  @item = Item.find(params[:id])
erb :'items/edit_item'
end

patch '/items/:id' do
   @item = Item.find(params[:id])
   @item.edit_item(params["item"])
   redirect to ("/items/#{@item.id}")

end

delete '/items/:id' do
  @item = Item.find(params[:id])
  @item.destroy
  redirect to("/items")
end

post '/items' do
      @item = Item.create(params["item"])
      redirect to("/items/#{@item.id}")
end

get '/items/new' do
   erb :'items/create_item'
end

get '/items/:id' do
   @item = Item.find_by(id:params[:id])
     erb :'items/show_item'


     end
end
