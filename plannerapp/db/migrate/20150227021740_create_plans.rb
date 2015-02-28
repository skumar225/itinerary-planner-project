class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :origin
      t.integer :destination_id
      t.string :name
      t.date :departure_date
      t.date :return_date
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
