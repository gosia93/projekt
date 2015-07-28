class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end
	def create
		super 
	end

 	def after_sign_up_path_for(resource)
    	if @user.role_id == 1
    		"/volonteers/new"
    	elsif @user.role_id == 2
    		"/organisations/new"
    	elsif @user.role_id == 3
    		"/individuals/new"
    	end
	end
end
