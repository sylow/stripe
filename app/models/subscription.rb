class Subscription < ActiveRecord::Base
  # associations
  belongs_to :user

  # hooks
  before_destroy :remove_subscription_from_stripe

  private

  def remove_subscription_from_stripe
    customer = Stripe::Customer.retrieve(user.stripe_customer_token)
    subscription = customer.subscriptions.first
    subscription.delete at_period_end: true
  end
end
