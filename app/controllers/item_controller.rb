class ItemController < ApplicationController

    before do
        require_login
    end

    ## CRUD-Read
    get '/items' do
        @items = Item.all
        erb :"items/index"
    end

    ##CRUD-Create
    get '/items/new' do
        erb :"items/create_item"
    end

    post '/items' do
        @item = Item.new(params)
        @item.user_id = current_user.id

        if @item.save
            current_user.items << @item
            redirect "/items/#{@item.id}"
        else
            flash[:message] = "All fields are needed to save item."
            redirect "/items/new"
        end
    end

    ##CRUD-Read
    get '/items/:id' do
        @item = Item.find_by(id: params[:id])
        if @item
            @user = User.find(@item.user_id)
            erb :"items/show_item"
        else
            redirect "/items"
        end
    end

    ##CRUD-Delete
    delete '/items/:id' do
        @item = Item.find(params[:id])

        if @item.user_id == current_user.id
            @item.delete
            redirect "/items"
        end
    end

    ##CRUD-Update
    get '/items/:id/edit' do
        @item = Item.find(params[:id])
        @user = User.find(@item.user_id)
        if @item.user_id == current_user.id
            erb :"items/edit_item"
        else
            redirect "/items/#{@item.id}"
        end
    end

    patch '/items/:id' do
        @item = Item.find(params[:id])

        if @item.user_id == current_user.id
            @item.title = params[:title]
            @item.character = params[:character]
            @item.description = params[:description]

            if @item.save
                redirect "/items/#{@item.id}"
            else
                flash[:message] = "All fields are needed to save item."
                redirect "/items/#{@item.id}/edit_item"
            end
        end
    end
end
