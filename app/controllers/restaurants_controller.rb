class RestaurantsController < ApplicationController

  def index
  @restaurants = Restaurant.all.order(created_at: :desc).limit(10)
  #order them by when they were updated, show only 10
  end

  def show
  @restaurant = Restaurant.find(params[:id])
  @reviews = Review.all.order(created_at: :desc).where(restaurant_id:"#{@restaurant.id}")
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to @restaurant
      else
      flash[:notice] = "Please enter all fields with a rating between 1-5"
      render :new
      end
  end

private

def restaurant_params
  params.require(:restaurant).permit(:name,:address,:city,:state,:zipcode,:description, :category)

end
end
