class DeleteStripeSubscription
  def self.destroy(user)
    customer = Stripe::Customer.retrieve(user.stripe_customer_token)
    customer.subscriptions.first.delete at_period_end: true
  end
end
