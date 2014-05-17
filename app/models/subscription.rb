class Subscription < ActiveRecord::Base
  # associations
  belongs_to :user

  # hooks
  before_create :set_customer_token
  before_destroy :remove_subscription_from_stripe
  
  # token
  attr_accessor :stripe_token  
  
  # Plans should go to their own tables
  PLAN_ID = 1
  def valid_subscription?
    !stripe_customer_token.blank?
  end
  
  private
  def set_customer_token
    customer = Stripe::Customer.create(plan: PLAN_ID, description: user.email, card: stripe_token)
    self.stripe_customer_token = customer.id
  end
  
  def remove_subscription_from_stripe
    customer = Stripe::Customer.retrieve(self.stripe_customer_token)
    subscription = customer.subscriptions.first
    subscription.delete at_period_end: true
  end
end
