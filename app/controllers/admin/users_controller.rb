class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(10)
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
     redirect_to admin_user_path(@user.id)
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
