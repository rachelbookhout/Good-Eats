class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    id = @restaurant.id
    @review = Review.new(review_params)
    @review.restaurant_id = id
    if @review.save
      redirect_to @restaurant
    else
     render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:body,:rating)
  end

end
