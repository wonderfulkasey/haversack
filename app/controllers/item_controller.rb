class ItemController < ApplicationController

get '/items' do
    if logged_in?
      @items = current_user.items
      erb :'items/index'
    else
      redirect to('/login')
    end
end

get '/items/new' do
   if logged_in?
     @current_user
     erb :'items/create'
   else
     redirect to('/login')
   end
end

post '/items' do
    if logged_in?
      @item = current_user.items.build(params)

           if !@item.save
             current_user.items << @item
             
             erb :'/items/#{@item.id}'

           else
            @errors = @item.errors.full_messages

             redirect to('/items')
           end

     else
       redirect to('/login')
    end
end


get '/items/:id' do
  @item = Item.find_by(id:params[:id])

        if logged_in? && @item.user == current_user
               erb :'items/#{@item.id}/show'
        else
          redirect to('/items')
        end
end


get '/items/:id/edit' do
   @item = Item.find(params[:id])

      if logged_in? && @item.user == current_user
      @user = User.find(@item.user_id)
     erb :'items/edit'
             
      else
      redirect to('/items')
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
                      erb :'/items/edit'
                      
                    else
                      redirect to("/items/#{@item.id}")
                      end
        else
          redirect "/items"
      end
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
end
