class Organisation < ActiveRecord::Base
	validates_presence_of :name, :regon, :city, :about, :volontary_type_id, :about
	has_attached_file :logo
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

	 has_attached_file :video,
          :processors => lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/ 

    belongs_to :volontary_type
    belongs_to :user
    has_many :comments, :as => :commentable
end
