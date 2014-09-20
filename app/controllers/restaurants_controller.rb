class RestaurantsController < ApplicationController

  def index
  @restaurants = Restaurant.all
  #order them by when they were updated, show only 10
  end

  def show
  @restaurant = Restaurant.find(params[:id])
  end

  def new
  @restaurant = Restaurant.new(restaurant_params)
  end

  def create
  @restaurant = Restaurant.new(restaurant_params)
  end

private

def restaurant_params
  params.require(:restaurant).permit(:name,:address,:city,:state,:zipcode)

end
end
