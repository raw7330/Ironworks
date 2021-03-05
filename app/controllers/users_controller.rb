class UsersController < ApplicationController
   
  def show
    @user = User.find(params[:id])
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
  end
  
  private
  def user_params
    params.require(:user).permit(:company_name, :company_name_kana, :postal_code, :address, :phone_number, :is_deleted )
  end
  
end
