class AddRestaurantIdtoReviews < ActiveRecord::Migration
  def up
  add_column :reviews, :restaurant_id, :integer
  end

  def down
  remove_column :reviews, :restaurant_id
  end
end
