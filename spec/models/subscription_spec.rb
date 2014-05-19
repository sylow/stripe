require 'spec_helper'

describe Subscription do
  before { StripeMock.start }
  before { Stripe::Plan.create(id: '1', name: 'Silver Plan', amount: 4999)}
  after  { StripeMock.stop }
  
  context '#successful subscriptions' do
    it "creates a subscription" do
      Fabricate(:subscription).active.should be_true
    end
  end
  
end
