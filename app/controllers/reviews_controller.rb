class ReviewsController < ApplicationController

  def new
  #binding.pry
  #@restaurant = Restaurant.find(params[:id])
  @review = Review.new
  end

  def create
  @restaurant = Restaurant.find(params[:id])
  @review = Review.new(review_params)
  @review.restaurant_id = @restaurant.id
  @reviews = Review.all.order(created_at: :desc).where(restaurant_id:"#{@restaurant.id}")
  if @restaurant.save == false
    render 'restaurants/show'
  else
    redirect_to @restaurant
  end
  end

  private

  def review_params
  params.require(:review).permit(:body,:rating)
  end

end
