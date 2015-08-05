class Volonteer < ActiveRecord::Base
	validates :name, presence: true
   	validates :surname, presence: true
   	validates :city, presence: true 
   	validates :age, presence: true
   	validates :about, presence: true
   	validates :user_id, presence: true
   	validates :volontary_type_id, presence: true
   	validates_format_of :city, :with => /\A\p{Lu}{1}\p{L}{2,}(\-{1}\p{Lu}{1}\p{L}{2,})*\z/,
     :message => "jest niepoprawna!"
     validates_numericality_of :age, :greater_than => 0

	has_attached_file :photo
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	belongs_to :volontary_type
	has_many :comments, :as => :commentable

	scoped_search :on => :city, :complete_value => :true, :default_order => true
end
