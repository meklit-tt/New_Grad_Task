class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  #before_action :load_rest, only: [:destroy]

  def index
     if params[:category].blank?
      @restaurants = Restaurant.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @restaurants = Restaurant.where(:category_id => @category_id).order("created_at DESC")
  end
end
  def show
  @restaurants= Restaurant.find(params[:id])
  if @restaurant.reviews.blank?
  @average_review = 0
  else
  @average_review = @restaurant.reviews.average(:rating).round(2)
  end
end
  def new
    @restaurant = current_user.restaurants.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    @restaurant.category_id = params[:category_id]
    if @restaurant .save
      redirect_to root_path
    else
      render 'new'
   end
 end
 def edit
   @categories = Category.all.map{ |c| [c.name, c.id] }
 end

 def update
   @restaurant.category_id = params[:category_id]
   if @restaurant.update(restaurant_params)
     redirect_to restaurant_path(@restaurant)
   else
     render 'edit'
 end
end
 def destroy
   @restaurant.destroy
   redirect_to root_path
 end
  private
   def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :category_id, :rest_img)
   end

   def find_restaurant
     @restaurant = Restaurant.find(params[:id])
   end
   def load_rest
      @restaurant= current_user.admin? ? Restaurant.find(params[:id]) : current_user.restaurants.find(params[:id])
    end
  end
