class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :address
      t.text :description
      t.string :remote_id
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
