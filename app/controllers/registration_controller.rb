class RegistrationController < Devise::RegistrationsController
	def create
    build_resource(sign_up_params)

    if resource.save

      # you will name the following param. make sure it's in devise strong_params
      # also the == will depend on how you pass the role - string, integer etc

      if sign_up_params[:role_id] == "1"
        user.add_role :volonteer
        resource.build_account(user_id: resource.id) # code to create user account
      elsif sign_up_params[:role_id] == "2"
        user.add_role :organisation
        resource.build_manager_account(user_id: resource.id) # code to create user account
      elsif sign_up_params[:role_id] == "3"
        user.add_role :individual
        resource.build_business_account(user_id: resource.id) # code to create user account
      end

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  # override the after signup path to your desired route, e.g
  def after_sign_up_path_for(resource)
    if sign_up_params[:role_id] == "1"
      edit_user_account_path(resource.id)
    elsif sign_up_params[:role_id] == "2"
      edit_user_manager_account_path(resource.id)
    elsif sign_up_params[:role_id] == "3"
      edit_user_business_account_path(resource.id)
    end 
  end
end
end
