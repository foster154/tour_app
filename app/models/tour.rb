class Tour < ActiveRecord::Base
	belongs_to :user
	has_many :photos, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	scope :recent_tours, order("created_at desc").limit(5)
	
	validates	:user_id, presence: true
	validates :address, presence: true
end
