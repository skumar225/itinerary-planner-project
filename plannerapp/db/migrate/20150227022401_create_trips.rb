class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :companion_id
      t.integer :destination_id

      t.timestamps null: false
    end
  end
end
