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

  context '#failing subscriptions' do
    it "mocks a declined card error" do
      StripeMock.prepare_card_error(:incorrect_cvc, :new_customer)
      customer = NewStripeCustomer.new
      customer.create(Fabricate(:user), 'test')
      customer.errors.should == ["We could not start your subscription because #<Stripe::CardError: (Status 402) The card's security code is incorrect>"]

    end
  end

end
