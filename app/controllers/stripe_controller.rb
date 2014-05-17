class StripeController < ApplicationController
  protect_from_forgery except: :webhook
  
  def stripe
    event = JSON.parse(request.body.read)

    # Transaction history
    SubscriptionHistory.create({
                                 stripe_customer_token: event.card.customer,
                                 data: request.body.read,
                                 notification_type: event.type
                               }
                               )    
    # if something goes wrong let our client know it
    if event.type == "charge.failed"
      if subscription = Subscription.where(stripe_customer_token: event.card.customer).first
        UserMailer.payment_failure(subscription.user).deliver    
      end
    end
    
    #lets please stripe by returning ok
    head :ok
  end
end
