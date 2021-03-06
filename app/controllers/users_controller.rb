class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @item = @user.items
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_params
    else
      render :edit
    end
  end

  def quit
  end

  def out
    current_user.update(is_deleted: true)
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
