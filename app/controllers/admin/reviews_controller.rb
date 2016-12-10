class ReviewsController < ApplicationController


  def create
    product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    if @product.save
      redirect_to :product, notice: 'Your review has been received'
    else
      redirect_to :product
    end
  end
end