class Tour < ActiveRecord::Base
	belongs_to :user
	has_many :photos, :inverse_of => :tour, dependent: :destroy # Added 'inverse_of' on 4/29, from Hasnan Tut
	accepts_nested_attributes_for :photos, allow_destroy: true # Added on 4/29, from Hasnan Tut for multi-photo uploads
	geocoded_by :address
	after_validation :geocode
	default_scope -> { order('created_at DESC') }
	scope :recent_tours, order("created_at desc").limit(5)
	
	validates	:user_id, presence: true
	validates :address, presence: true
end
