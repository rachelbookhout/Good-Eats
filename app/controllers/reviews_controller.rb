class ReviewsController < ApplicationController

  def new
  #binding.pry
  #@restaurant = Restaurant.find(params[:id])
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
  end

  def create
  #binding.pry
  id = params[:review][:restaurant_id]
  #@restaurant = Restaurant.find(params[:id])
  @review = Review.new(review_params)
  @review.restaurant_id = id
  #@review.restaurant_id = @restaurant.id
  #@reviews = Review.all.order(created_at: :desc).where(restaurant_id:"#{@restaurant.id}")
  if @review.save == false
    render 'restaurants/show'
  else
  redirect_to restaurants_path
  end
  end

  private

  def review_params
  params.require(:review).permit(:body,:rating)
  end

end
