class Individual < ActiveRecord::Base
	belongs_to :user

	scoped_search :on => :city, :complete_value => :true, :default_order => true
end
