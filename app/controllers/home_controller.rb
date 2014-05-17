class HomeController < ApplicationController
  def index
    if current_user 
      @subscription = current_user.subscription || current_user.build_subscription    
    end
  end
end
