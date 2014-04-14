class Photo < ActiveRecord::Base
	belongs_to :tour
	mount_uploader :photo, PhotoUploader

	validates :tour_id, presence: true
	validates :photo, presence: true
end
