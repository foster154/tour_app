class LeadMailer < ActionMailer::Base
  default from: "support@showandtour.com"

  def new_lead(lead)  # send notification of a new lead to the agent
    @lead = lead
    if Rails.env.production?
    	mail to: lead.tour.user.email, cc: "info@showandtour.com", subject: "New Lead from Show & Tour"
    else
    	mail to: lead.tour.user.email, cc: "info@showandtour.com", subject: "(DEV) New Lead from Show & Tour"
	end
  end
end
