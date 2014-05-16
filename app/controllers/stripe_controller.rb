class StripeController < ApplicationController
  protect_from_forgery except: :webhook
  
  def stripe
    event = JSON.parse(request.body.read)
    
    if event.type == "charge.failed"
      if subscription = Subscription.where(stripe_customer_token: event.card.customer).first
        UserMailer.payment_failure(subscription.user).deliver        
      end
    end
    
    #lets please stripe
    head :ok
  end
end
