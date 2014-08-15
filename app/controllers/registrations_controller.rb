class RegistrationsController < Devise::RegistrationsController

	def update_card
	    @user = current_user
	    @user.stripe_token = params[:user][:stripe_token]
	    if @user.save
	      redirect_to edit_user_registration_path, :notice => 'Your credit card has been updated.'
	    else
	      flash.alert = 'Unable to update card.'
	      render :edit
	    end
	  end

end