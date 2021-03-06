class Plan < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_create :notify_subscriptions, if: :geocoded?

  private

  def notify_subscriptions
    Subscription.all.each do |subscription|
      if self.distance_from(subscription, :km) < subscription.radius.to_f/1000
        subscription.notify(self)
      end
    end
  end
end
