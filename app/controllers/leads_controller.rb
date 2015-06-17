class LeadsController < ApplicationController

	def create
		# @tour = Tour.find(params[:id])
		@lead = Lead.new(lead_params)
		if @lead.save
			# Send email w/ lead info to the agent (if setting is turned on)
        	LeadMailer.new_lead(@lead).deliver if @lead.tour.user.email_scheduler_leads?
			redirect_to :back
		else
			redirect_to :back
		end
	end

	def index
		@user = User.find(current_user.id)
		@leads = @user.leads.page(params[:page]).per_page(20)
	end

	private

	def lead_params
    	params.require(:lead).permit( 	:user_id,
    									:tour_id, 
    									:name,
    									:contact_info,
    									:schedule_showing,
    									:get_more_info,
    									:send_list )
  	end
end
