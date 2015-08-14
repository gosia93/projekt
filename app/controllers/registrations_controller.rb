class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end
	def create
		super 
	end

 	def after_sign_up_path_for(resource)
    	if @user.role_id == 1
    		"/12_koselak/wolontariat/volonteers/new"
    	elsif @user.role_id == 2
    		"/12_koselak/wolontariat/organisations/new"
    	elsif @user.role_id == 3
    		"/12_koselak/wolontariat/individuals/new"
    	end
	end
end
