class ReviewsController < ApplicationController

  def create

    puts params

    product = Product.find(params[:product_id])
    review = Review.new(review_params)
    review.product = product

    if review.save
      redirect_to product_path(params[:product_id]), notice: 'Review created'
    end
  end  

  private

  def review_params
    params.require(:review).permit(:description)
  end

end
