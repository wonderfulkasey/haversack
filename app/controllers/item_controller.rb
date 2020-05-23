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
             redirect "/items/#{@item.id}"

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
          @user = User.find(@item.user.id)
          erb :"items/show"
        else
          redirect to('/items')
        end
end

delete '/items/:id/delete' do
    @item = Item.find(params[:id])

              if logged_in? && @item.user == current_user
                @item.destroy
                redirect to('/items')
             else
                redirect to('/login')
              end
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

          if @item.user_id == current_user.id
            @item.title = params[:title]
            @item.description = params[:description]
            @item.character = params[:character]

                  if !@item.save
                      redirect "/items/#{@item.id}"

                    else
                      @errors = @item.errors.full_messages
                      redirect "/items/edit"
                      end
        else
          redirect "/items"
      end
end
