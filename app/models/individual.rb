class Individual < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :as => :commentable

	scoped_search :on => :city, :complete_value => :true, :default_order => true
end
