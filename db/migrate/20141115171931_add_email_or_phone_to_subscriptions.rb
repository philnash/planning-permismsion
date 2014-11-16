class AddEmailOrPhoneToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :email, :boolean
    add_column :subscriptions, :phone, :boolean
  end
end
