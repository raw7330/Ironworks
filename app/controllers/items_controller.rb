class ItemsController < ApplicationController
   before_action :authenticate_user!


  def index
    @items = Item.all.page(params[:page]).per(10)
    @q =Item.ransack(params[:q])
    @items = @q.result(distinct: true).page(params[:page]).per(10) if params[:q] # 後置
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
      flash[:notice] = '編集完了しました'
      redirect_to items_path
    else
      flash[:alert] = '編集失敗しました'
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
    # binding.pry
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @genres = Genre.all
    # binding.pry
    if @item.save
      flash[:notice] = '投稿完了しました'
      redirect_to items_path
    else
      flash[:alert] = '投稿失敗しました'
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :image, :delivery_date)
  end

end
