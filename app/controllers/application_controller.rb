class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_name_kana, :postal_code, :address, :phone_number, :email, :encrypted_password])
  end

  def after_sign_in_path_for(resource)
    items_path
  end

  # if resource_name == :admin
  #   root_path
  # elsif resource_name == :user
  #   new_user_registration_path
  # end
  # end
end
