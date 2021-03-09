class ReviewsController < ApplicationController
  before_action :find_restaurant
  before_action :find_review, only:[:edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit]
  def new
    @review = Review.new
    if current_user
    @review = Review.where(user_id: current_user.id, restaurant_id: params[:restaurant_id]).first_or_initialize
    if @review.id.present?
      redirect_to restaurant_path(@restaurant)
      flash[:notice] = 'multiple review not allowd'
    else
      render 'edit'
    end
  end
  end
  def create
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    @review.user_id = current_user.id
    if @review.save
      #ReviewMailer.review_mailer(@restaurant).deliver
      flash[:notice] = 'review created'
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
  end
end

 def edit
 end

 def update

   if @review.update(review_params)
			redirect_to restaurant_path(@restaurant)
		else
			render 'edit'
		end
 end
 def destroy
    @review.destroy
		redirect_to restaurant_path(@restaurant)
	end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  def find_review
    @review = Review.find(params[:id])
  end


end
