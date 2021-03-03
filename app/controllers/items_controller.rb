class ItemsController < ApplicationController

  def index
  end

  def show
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
    @genres = Genre.all
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :image_id, :derivery_date)
  end
end
