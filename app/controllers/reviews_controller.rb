class ReviewsController < ApplicationController

  before_action :require_login

  def create

    @product = Product.find(params[:product_id])
    @review = Review.new()
    @review.product = @product
    @review.user = current_user
    @review.rating = params[:review][:rating]
    @review.description = params[:review][:description]

    if @review.save!
      redirect_to product_path(params[:product_id]), notice: "Review created"
    end
  end  

  def destroy
    review = Review.find(params[:id])

    if review.destroy 
      redirect_to product_path(params[:product_id]), notice: "Review deleted"
    else
      redirect_to product_path(params[:product_id]), notice: "Could not delete the Review"
    end
  end

  private
  def require_login
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to create or delete a review"
      redirect_to "/login"
    end
  end

end
  


  
