class HomeController < ApplicationController
  def index
    @subscription = current_user.subscription || current_user.build_subscription if current_user    
  end
end
