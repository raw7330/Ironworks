class Admins::UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to admins_user_path(@user.id)
    else
     render :edit
    end
  end
  
private
  def user_params
    params.require(:user).permit(:company_name, :company_name_kana, :postal_code, :address, :phone_number, :is_deleted )
  end  
  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :image, :delivery_date)
  end
end
