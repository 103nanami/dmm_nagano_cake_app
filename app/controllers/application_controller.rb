class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session


  protected

  #def after_sign_in_path_for(resource)
    #case resource
    #when Admin
      #admin_path
    #end
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:adress,:telephone_number,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
