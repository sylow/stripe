class SubscriptionsController < ApplicationController
  def index
    @subscription = current_user.subscriptions.build if current_user
  end
end
