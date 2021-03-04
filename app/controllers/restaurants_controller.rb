class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_selet, only: [:new, :edit, :create]
  #before_action :set_search

  def index

       if params[:category].blank?
       @restaurants = Restaurant.all.order("created_at DESC").page(params[:page])

    else
       @category_id = Category.find_by(name: params[:category]).id
       @restaurants = Restaurant.where(:category_id => @category_id).order("created_at DESC")
    end
end
def search
  @restaurants=Restaurant.where("name LIKE ?", "%" + params[:q] + "%").page(params[:page])
end

  def show
      @restaurants= Restaurant.find(params[:id])
      if @restaurants.reviews.blank?
      @average_review = 0
     else
     @average_review = @restaurants.reviews.average(:rating).round(2)
    end
end

  def new
     @restaurants = current_user.restaurants.build
     #@categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
     @restaurants = current_user.restaurants.build(restaurant_params)
    # @restaurants.category_id = params[:category_id]
  if @restaurants .save
     # RestMailer.rest_mailer(@restaurant).deliver
      flash[:notice] = 'New Restaurant added'
      redirect_to root_path
    else
      render 'new'
   end
 end

 def edit
     @categories = Category.all.map{ |c| [c.name, c.id] }
 end

 def update
    #@restaurants.category_id = params[:category_id]
    if @restaurants.update(restaurant_params)
     redirect_to restaurant_path(@restaurants)
   else
     render 'edit'
 end
end

 def destroy
   @restaurants.destroy
   redirect_to root_path
 end
   private
   def restaurant_params
    params.require(:restaurant).permit(:name, :address,
                                       :description, :category_id,
                                       :rest_img, :q)
  end

  def find_restaurant
     @restaurants = Restaurant.find(params[:id])
  end

  def set_selet
     @categories = Restaurant.all.map{ |c| [c.name, c.id] }
  end
  def set_search
     @search = Restaurant.ransack(params[:q])
     @restaurants = @search.result
   end
end
