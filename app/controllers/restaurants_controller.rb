class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_selet, only: [:new, :edit, :create]
  before_action :set_search
PER=3
  def index
    @search = Restaurant.ransack(params[:q])
    @restaurants = @search.result
     if params[:category].blank?
      @restaurants = Restaurant.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @restaurants = Restaurant.where(:category_id => @category_id).order("created_at DESC")
  end
end
  def show
  @restaurants= Restaurant.find(params[:id])
  if @restaurant.eviews.blank?
  @average_review = 0
  else
  @average_review = @restaurant.reviews.average(:rating).round(2)
  end
  end

  def new
    @restaurant = current_user.restaurants.build
  #  @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    @restaurant.category_id = params[:category_id]
    if @restaurant .save
    # RestMailer.rest_mailer(@restaurant).deliver
      flash[:notice] = 'New Restaurant added'
      redirect_to root_path
    else
      render 'new'
   end
 end
 def edit
   #@categories = Category.all.map{ |c| [c.name, c.id] }
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
    params.require(:restaurant).permit(:name, :address,
                                       :description, :category_id,
                                       :rest_img, :q)
   end

   def find_restaurant
     @restaurant = Restaurant.find(params[:id])
   end

   def set_selet
     @categories = Restaurant.all.map{ |c| [c.name, c.id] }
  end
  def set_search
      @search = Restaurant.ransack(params[:q])
      @restaurant = @search.result
    end
end
