class Agent < ActiveRecord::Base

	belongs_to :user
	belongs_to :tour

	has_attached_file :agent_image, styles: { small: "64x64#", large: "200x200#" }
	validates_attachment  :agent_image,
  											content_type: { content_type: /\Aimage\/.*\Z/ },
  											size: { in: 0..1.megabyte }

end
