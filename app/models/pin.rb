class Pin < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :boards

	has_attached_file :image, styles: { index: "318x180>", show: "636x360>" } , default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :image, attachment_presence: true
	validates :title, presence: true
	validates :description, presence: true

end
