class Photo < ActiveRecord::Base
	belongs_to :tour
	acts_as_list scope: :tour
	mount_uploader :photo, PhotoUploader

	validates :tour_id, presence: true
	validates :photo, presence: true

end
