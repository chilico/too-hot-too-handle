class ReviewsController < ApplicationController
  before_action :set_chilli, only: %i[create]

  def create
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
