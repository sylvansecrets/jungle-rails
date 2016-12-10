class ReviewsController < ApplicationController

  before_filter :current_user

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.new(review_params)
    @review.user= current_user
    @review.inspect
    puts "insepecting review"
    if @review.save
      redirect_to product, notice: 'Your review has been received'
    else
      redirect_to '/', notice: 'Your review has failed'
    end
  end

  def destroy
    @review = Review.find_by(product_id: params[:product_id], user_id: current_user.id)
    @product = Product.find(params[:product_id])
    puts current_user.id, @review, @product, 'fffffffff'
    if @review.destroy!
      redirect_to [@product]
    else
      redirect_to [@product]
    end

  end
  private

  def review_params
    params.require(:review).permit(
      :description,
      :product_id,
      :rating
    )
  end

end