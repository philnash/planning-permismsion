class SubscriptionMailer < ActionMailer::Base
  default from: "hackney@philnash.ngrok.com"

  def alert(subscription, plan)
    @subscription = subscription
    @plan = plan
    mail(
      :to => subscription.user.email,
      :subject => 'New planning application in Hackney'
    ) do |format|
      format.text
    end
  end
end
