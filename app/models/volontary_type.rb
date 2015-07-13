class VolontaryType < ActiveRecord::Base
	has_many :volonteers
	has_many :organisations
	has_many :individuals
end
