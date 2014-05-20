class Subscription < ActiveRecord::Base
  # associations
  belongs_to :user

  # hooks
  before_destroy :remove_subscription_from_stripe

  private

  def remove_subscription_from_stripe
    PaymentServices::Subscription.new(user).destroy
  end
end
