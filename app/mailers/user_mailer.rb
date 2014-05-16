class UserMailer < ActionMailer::Base
  default from: "gokhan@sylow.net"

  def payment_failure(user)
    mail(
      :subject => 'Your subscription payment has failed',
      :to      => user.email,
      :tag     => 'payment-failed'
    )
  end
  
end