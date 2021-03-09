class ItemsController < ApplicationController

  def index
    @items = Item.all
    @q =Item.ransack(params[:q])
    @items = @q.result(distinct: true) if params[:q] # 後置
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @comment = Comment.new
    @comments = @item.comments
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path  
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
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
