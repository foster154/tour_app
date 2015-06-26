class ChargesController < ApplicationController

	after_action :add_tour_credit, only: [:create]

	def new
	end

	def create
	  # Amount in cents
	  @amount = 1200

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Show & Tour Virtual Tour',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to dashboard_path
	end

	private

	def add_tour_credit
		current_user.tour_credits = current_user.tour_credits + 1
		current_user.save
	end

end
