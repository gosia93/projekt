class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	before_filter :configure_permitted_parameters, if: :devise_controller?


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

  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Nie masz wystarczających uprawnień. Zaloguj się lub zarejestruj się i wybierz odpowiedni rodzaj użytkownika."
  redirect_to root_url
end

end
