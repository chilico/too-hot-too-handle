class SalesChillisController < ApplicationController
  before_action :set_basket, only: %i[create]

  def create
    @chilli = Chilli.find(params[:chilli_id])
    @sale_chilli = SalesChilli.create(sale: @sale, chilli: @chilli)
    @sale.update(price_cents: @sale.chillis.all.map(&:price_cents).reduce(:+))
    flash[:notice] = "#{@chilli.variety} added to basket"
    redirect_to chilli_path(@chilli)
  end

  private

  def set_basket
    sales = Sale.where(user: current_user)
    @sale = sales.where(status: 'basket').first
  end

  def sales_chilli_params
    params.require(:sale_chilli).permit(:quantity)
  end
end
