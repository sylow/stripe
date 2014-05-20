require 'spec_helper'

describe Subscription do
  before { StripeMock.start }
  before { Stripe::Plan.create(id: '1', name: 'Silver Plan', amount: 4999)}
  after  { StripeMock.stop }

  context '#successful subscriptions' do
    it ".creates a subscription" do
      stripe_customer = NewStripeCustomer.new
      customer = stripe_customer.create(Fabricate(:user), 'xxxx')
      customer.subscriptions.count.should == 1
      Fabricate(:subscription).active.should be_true
    end
  end

  context '#failing subscriptions' do
    it ".returns a declined card error" do
      StripeMock.prepare_card_error(:incorrect_cvc, :new_customer)
      customer = NewStripeCustomer.new
      customer.create(Fabricate(:user), 'test')
      customer.errors.should == ["We could not start your subscription because #<Stripe::CardError: (Status 402) The card's security code is incorrect>"]
    end
  end

  context '#cancel subsciption' do
    it '.cancel successfully' do
      subscription = Fabricate(:subscription)
      stripe_customer = NewStripeCustomer.new
      customer = stripe_customer.create(subscription.user, 'test_customer_sub')
      customer.subscriptions.count.should == 1
      subscription.destroy

      customer = Stripe::Customer.retrieve(customer.id)

      expect(customer.subscriptions.first.status).to eq('active')
      expect(customer.subscriptions.first.cancel_at_period_end).to be_true
      expect(customer.subscriptions.first.ended_at).to be_nil
      expect(customer.subscriptions.first.canceled_at).to_not be_nil
    end
  end
end
