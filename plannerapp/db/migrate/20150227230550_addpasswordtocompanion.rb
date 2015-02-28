class Addpasswordtocompanion < ActiveRecord::Migration
  def change
    add_column :companions, :password, :string
    add_column :companions, :password_digest, :string
  end
end
