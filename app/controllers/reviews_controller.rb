class ReviewsController < ApplicationController
  before_action :set_chilli, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.chilli = @chilli
    if @review.save
      redirect_to sales_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_chilli
    @chilli = Chilli.find(params[:chilli_id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
