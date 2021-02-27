class RestaurantsController < ApplicationController
  def index
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
  end

  private
   def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description)
   end
end
