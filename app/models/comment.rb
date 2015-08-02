class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user 
	scope :approved, -> { where status: 'approved'}
  	scope :draft, -> { where status: 'draft'}
end
