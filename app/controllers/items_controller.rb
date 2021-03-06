class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
    @item = Item.new
    @items = Item.all
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @genres = Genre.all
    # binding.pry
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :image, :delivery_date)
  end

end
