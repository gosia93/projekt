class VolontaryType < ActiveRecord::Base
	validates_presence_of :name

	has_many :volonteers
	has_many :organisations
	has_many :individuals
end
