class StripeController < ApplicationController
  protect_from_forgery except: :webhook
  
  def webhook
    event = JSON.parse(request.body.read)
    customer_token = event.fetch("data").fetch("object").fetch("customer")
    notification_type = event.fetch("type")
    # Transaction history
    SubscriptionHistory.create( {
                                  stripe_customer_token: customer_token,
                                  data: request.body.read,
                                  notification_type: notification_type
                                }
                              )    
                               
    # Does this client has a subscription with us?
    if subscription = Subscription.where(stripe_customer_token: customer_token).first      
      if notification_type == "invoice.payment_failed"        # if something goes wrong let our client know it
        UserMailer.payment_failure(subscription.user).deliver    
        subscription.update_attribute(:active, false)    
      elsif notification_type == "invoice.payment_succeeded"  # Activate this client if charge is successful
        subscription.update_attribute(:active, true)    
      end
    end        
    
    head :ok # stripe requires us to return ok
  end
end
