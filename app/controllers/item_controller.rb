class ItemController < ApplicationController



#1, crud - read
  get '/items' do
      redirect_if_not_logged_in
      @items = current_user.items
      erb :'items/index'
  end

#2, crud - read, create
  get '/items/new' do
     @current_user
     erb :'items/create'
  end


  post '/items' do
       @item = current_user.items.build(params)

      if !@item.save
       @errors = @item.errors.full_messages
       erb :'/items/create'
      else
         redirect to('/items')
      end
  end

#3, crud - read specific id
  get '/items/:id' do
    @item = Item.find_by(id: params[:id])
        if logged_in? && @item.user == current_user
          erb :'items/show'
        else
          redirect to('/login')
        end
  end

#  get '/items/:id/show' do
#    @item = Item.find_by(id: params[:id])
#        if logged_in? && @item.user == current_user
#          erb :'items/show'
#        else
#          redirect to('/login')
#        end
#  end

#4, crud - read/get form, patch updates
  get '/items/:id/edit' do
    @item = Item.find(params[:id])
        if logged_in? && @item.user == current_user
          @item = Item.find(params[:id])
          @user = User.find(session[:user_id])
          erb :'items/edit'
        else
          redirect to("/login")
        end
  end

  patch '/items/:id' do
    @item = Item.find(params[:id])
    @item.title = params[:title]
    @item.description = params[:description]
    @item.character = params[:character]
        if !@item.save
          @errors = @item.errors.full_messages
          erb :'/items/edit'
        else
          redirect to("/items/#{@item.id}")
        end
  end

#5, crud - delete form
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
