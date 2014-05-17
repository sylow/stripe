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
                               
    # Does this client has a subscription with us?
    if subscription = Subscription.where(stripe_customer_token: event.card.customer).first      
      if event.type == "charge.failed"        # if something goes wrong let our client know it
        UserMailer.payment_failure(subscription.user).deliver    
      elsif event.type == "charge.succeeded"  # Activate this client if charge is successful
        subscription.update_attribute(:active, true)    
      end
    end        
    
    head :ok # stripe requires us to return ok
  end
end
