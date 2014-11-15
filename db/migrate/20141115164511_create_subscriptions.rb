class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :radius
      t.timestamps
    end
  end
end
