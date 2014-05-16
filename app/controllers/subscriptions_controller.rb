class SubscriptionsController < ApplicationController
  def create
    @subscription = current_user.subscription || current_user.build_subscription(subscription_params)
    if @subscription.save
      redirect_to root_path, :notice => "Thank you for subscribing!"
    else
      render '/home/index'
    end
  end

  def destroy
    if current_user.subscription.destroy
      redirect_to root_path, :notice => "Your subscription will expire."
    end
  end
  
  private
  def subscription_params
    params.require(:subscription).permit(:stripe_token)
  end
end
