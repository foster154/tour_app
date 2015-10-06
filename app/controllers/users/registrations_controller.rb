class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do
    	# send me a notification when new user signs up
      UserMailer.new_user(@user).deliver
    end
  end
end