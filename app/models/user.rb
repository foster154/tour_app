class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tours, dependent: :destroy
  has_many :leads

  has_attached_file :user_image, :styles => { :square => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :user_image, :content_type => /\Aimage\/.*\Z/

  # attr_accessor :stripe_token, :coupon
  # before_save :update_stripe
  # before_destroy :cancel_subscription

  def tour_available?
    self.tour_credits > 0 || self.tours_unlimited
  end

  # disabled on 

  # def update_stripe
  # 	return if email.include?('foster154@gmail.com')
  #   return if email.include?('johntdunstan@gmail.com')
  #   return if email.include?('@example.com') and not Rails.env.production?
  #   if customer_id.nil?
  #     if !stripe_token.present?
  #       raise "Stripe token not present. Can't create account."
  #     end
  #     if coupon.blank?
  #       customer = Stripe::Customer.create(
  #         :email => email,
  #         :description => first_name,
  #         :card => stripe_token,
  #         :plan => 'earlyadopter'
  #       )
  #     else
  #       customer = Stripe::Customer.create(
  #         :email => email,
  #         :description => first_name,
  #         :card => stripe_token,
  #         :plan => 'earlyadopter',
  #         :coupon => coupon
  #       )
  #     end
  #   else
  #     customer = Stripe::Customer.retrieve(customer_id)
  #     if stripe_token.present?
  #       customer.card = stripe_token
  #     end
  #     customer.email = email
  #     customer.description = first_name + " " + last_name
  #     customer.save
  #   end
  #   self.last_4_digits = customer.cards.data.first["last4"]
  #   self.customer_id = customer.id
  #   self.stripe_token = nil
  # rescue Stripe::StripeError => e
  #   logger.error "Stripe Error: " + e.message
  #   errors.add :base, "#{e.message}."
  #   self.stripe_token = nil
  #   false
  # end

  def cancel_subscription  # NOT CURRENTLY WORKING OR ENABLED
    unless customer_id.nil?
      customer = Stripe::Customer.retrieve(customer_id)
      unless customer.nil? or customer.respond_to?('deleted')
        if customer.subscription.status == 'active'
          customer.cancel_subscription
        end
      end
    end
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "Unable to cancel your subscription. #{e.message}."
    false
  end

end
