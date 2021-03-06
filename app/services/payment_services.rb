module PaymentServices
  class Customer

    # Plans should go to their own tables
    PLAN_ID = 1
    attr_reader :errors

    def initialize
      @errors = []
    end

    def create(user, stripe_token)
      customer = Stripe::Customer.create(plan: PLAN_ID, description: user.email, card: stripe_token)
      user.update_attribute(:stripe_customer_token, customer.id)
      return customer
    rescue Stripe::CardError => e
       @errors << "We could not start your subscription because #{e.inspect}"
       return nil
    end
  end

  class Subscription
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def destroy
      customer = Stripe::Customer.retrieve(user.stripe_customer_token)
      customer.subscriptions.first.delete at_period_end: true
    end
  end
end
