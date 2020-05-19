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
  if logged_in? && @item.user == current_user
    @item.destroy
    redirect to('/items')
  else
    redirect to('/login')
  end

end

post '/items' do
  if logged_in?
       @item = current_user.items.build(params)

       if !@item.save
         @errors = @item.errors.full_messages
         erb :'/items/create_item'

       else
         redirect to('/items')
       end

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
end
