class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :location
      t.string :name
      t.date :destination_date
      t.integer :plan_id

      t.timestamps null: false
    end
  end
end
