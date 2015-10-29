class Agent < ActiveRecord::Base

	belongs_to :user
	belongs_to :tour

	has_attached_file :user_image, styles: { :square => "150x150#" }
	validates_attachment  :user_image,
  											content_type: { content_type: /\Aimage\/.*\Z/ },
  											size: { in: 0..1.megabyte }

	def full_name
		"#{first_name} #{last_name}"
	end

end
