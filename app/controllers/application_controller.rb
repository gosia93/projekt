class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	before_filter :configure_permitted_parameters, if: :devise_controller?

  def is_volonteer
    curent_user.role_id = 1
  end
  
  def is_organisation
    current_user.role_id = 2
  end

  def is_individual
    current_use.role_id = 3
  end

	protected
		def configure_permitted_parameters
  			devise_parameter_sanitizer.for(:sign_up) << :name
  			devise_parameter_sanitizer.for(:account_update) << :name
  			devise_parameter_sanitizer.for(:sign_up) << :role_id
  			devise_parameter_sanitizer.for(:account_update) << :role_id
          devise_parameter_sanitizer.for(:sign_up) << :login
        devise_parameter_sanitizer.for(:account_update) << :login
		end

  protect_from_forgery with: :exception
end
