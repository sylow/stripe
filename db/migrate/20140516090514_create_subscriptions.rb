class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.string :stripe_customer_token
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
