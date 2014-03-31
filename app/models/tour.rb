class Tour < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	scope :recent_tours, order("created_at desc").limit(5)
	validates	:user_id, presence: true
end
