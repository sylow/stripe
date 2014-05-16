class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.datetime :expires_at
      t.string :stripe_token

      t.timestamps
    end
  end
end
