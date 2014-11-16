class Subscription < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  belongs_to :user

  validates :address, :presence => true
  validates :radius, :presence => true
end
