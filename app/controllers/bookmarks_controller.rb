class BookmarksController < ApplicationController
  # before_action :set_item

  def index
   @user = current_user
   @bookmarks = @user.bookmarks
  end

  def create
    @item = Item.find(params[:item_id])
    @bookmark = current_user.bookmarks.new(item_id: @item.id)
    @bookmark.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @bookmark = current_user.bookmarks.find_by(item_id: @item.id)
    @bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :image, :delivery_date)
  end
  # def set_item
  #   @item = Item.find(params[:item_id])
  # end
end
