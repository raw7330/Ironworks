class CommentsController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      flash[:notice] = 'コメント完了しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'コメント失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path(params[:item_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
