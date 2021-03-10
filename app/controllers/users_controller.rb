class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @item = @user.items
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = '編集完了しました'
      redirect_to user_params
    else
      flash[:alert] = '編集失敗しました'
      render :edit
    end
  end

  def quit
  end

  def out
    current_user.destroy #paranoidでdestroyが上書きされる
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:company_name, :company_name_kana, :postal_code, :address, :phone_number, :is_deleted )
  end
  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :image, :delivery_date)
  end

end
