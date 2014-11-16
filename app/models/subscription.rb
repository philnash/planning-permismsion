class Subscription < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  belongs_to :user

  validates :address, :presence => true
  validates :radius, :presence => true

  def notify(plan)
    if phone?
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      client.messages.create(
        :from => ENV['TWILIO_PHONE_NUMBER'],
        :to => user.phone_number,
        :body => "Alert: new planning permission application. Details at #{url_for(plan)}"
      )
    end
    if email?
      Rails.logger.info("Alert: new planning permission application. Details at #{url_for(plan)}")
    end
  end
end
