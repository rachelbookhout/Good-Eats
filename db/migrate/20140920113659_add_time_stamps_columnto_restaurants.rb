class AddTimeStampsColumntoRestaurants < ActiveRecord::Migration
  def up
  add_column :restaurants, :created_at, :timestamps
  end

  def down
  remove_column :restaurants, :created_at
  end
end
