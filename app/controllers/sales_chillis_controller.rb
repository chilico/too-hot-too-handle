class SalesChillisController < ApplicationController
  before_action :set_sale, only: %i[create]

  def create
    @chilli = Chilli.find(params[:chilli_id])
    @sale_chilli = SalesChilli.create(sale: @sale, chilli: @chilli)
    flash[:notice] = "#{@chilli.variety} added to basket"
    redirect_to chilli_path(@chilli)
  end

  private

  def set_sale
    sales = Sale.where(user: current_user)
    @sale = sales.where.not(status: 'complete').first
  end

  def sales_chilli_params
    params.require(:sale_chilli).permit(:quantity)
  end
end
