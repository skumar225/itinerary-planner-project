class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :review_text
      t.integer :reviewable_id
      t.string :reviewable_type
      t.integer :companion_id

      t.timestamps null: false
    end
  end
end
