class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    #tests params
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    id = @restaurant.id
    @review = Review.new(review_params)
    @review.restaurant_id = id
    if @review.save
      redirect_to @restaurant
     else
     redirect_to new_restaurant_review_path(id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:body,:rating)
  end

end
