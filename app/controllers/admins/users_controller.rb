class Admins::UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
private
  def user_params
    params.require(:user).permit(:company_name, :company_name_kana, :postal_code, :address, :phone_number, :is_deleted )
  end  
end
