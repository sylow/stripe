class CreateSubscriptionHistories < ActiveRecord::Migration
  def change
    create_table :subscription_histories do |t|
      t.string :stripe_customer_token
      t.string :notification_type
      t.text :data

      t.timestamps
    end
  end
end
