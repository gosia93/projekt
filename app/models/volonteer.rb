class Volonteer < ActiveRecord::Base

	has_attached_file :photo
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	belongs_to :volontary_type
end
