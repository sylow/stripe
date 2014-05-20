class SubscriptionsController < ApplicationController
  def create
    customer = PaymentServices::Customer.new
    if customer.create(current_user, params[:stripe_token])
      if @subscription = current_user.create_subscription
        redirect_to root_path, :notice => "Thank you for subscribing to our services."
      else
        render '/home/index'
      end
    else
      @subscription = current_user.build_subscription
      flash.now[:notice] = customer.errors.join(", ")
      render '/home/index', notice: customer.errors.join(", ")
    end
  end

  def update
    if current_user.subscription.update(subscription_params)
      redirect_to root_path, :notice => "Thank you for subscribing to our services."
    else
      render '/home/index'
    end
  end

  def destroy
    if current_user.subscription.destroy
      redirect_to root_path, :notice => "Your subscription will expire at the end your subscription period."
    end
  end

end
