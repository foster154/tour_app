class UserMailer < ActionMailer::Base
  default from: "support@showandtour.com"

  # send notification of a new user signup
  def new_user(user)  
    @user = user
    if Rails.env.production?
    	mail to: "info@showandtour.com", subject: "New User Signup!"
    else
    	mail to: "foster154@gmail.com", subject: "(DEV) New User Signup!"
		end
  end
end
