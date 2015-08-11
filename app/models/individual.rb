class Individual < ActiveRecord::Base
	validates :name, presence: true
   	validates :surname, presence: true
   	validates :city, presence: true 
   	validates :age, presence: true
   	validates :about, presence: true
   	validates :needs, presence: true
   	validates :user_id, presence: true
   	#validates_format_of :city, :with => /\Ap{Lu}{1}\p{Ll}+(\-|\s)?(\p{Lu}{1}\p{Ll}+)?\z/,
     #:message => "jest niepoprawne!"
     validates_numericality_of :age, :greater_than => 0
	has_attached_file :photo
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates_uniqueness_of :user_id

	belongs_to :user
	has_many :comments, :as => :commentable

	scoped_search :on => :city, :complete_value => :true, :default_order => true
end
