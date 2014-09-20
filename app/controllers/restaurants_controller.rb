class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  #order them by when they were updated, show only 10
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to @restaurant
      else
        render :new
      end
  end

private

def restaurant_params
  params.require(:restaurant).permit(:name,:address,:city,:state,:zipcode,:description, :category)

end
end
