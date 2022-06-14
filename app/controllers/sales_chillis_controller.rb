class SalesChillisController < ApplicationController
  before_action :set_basket, only: %i[create update destroy]

  def create
    qty = params[:chilli][:quantity].to_i
    @chilli = Chilli.find(params[:chilli_id])
    @sale_chilli = SalesChilli.create(
      sale: @sale,
      chilli: @chilli,
      quantity: qty,
      price_cents: qty * @chilli.price_cents
    )
    update_sale_price(@sale)
    @chilli.update(quantity: @chilli.quantity - qty)
    flash[:notice] = "#{@chilli.variety} added to basket"
    redirect_to chilli_path(@chilli)
  end

  def update
    @sales_chilli = SalesChilli.find(params[:id])
    @sales_chilli.updtae(quantity: params[:sales_chilli][:quantity])
    update_sale_price(@sale)
    redirect_to sale_path(@sale), status: :see_other
  end

  def destroy
    @sales_chilli = SalesChilli.find(params[:id])
    @sales_chilli.destroy
    update_sale_price(@sale)
    redirect_to sale_path(@sale), status: :see_other
  end

  private

  def set_basket
    sales = Sale.where(user: current_user)
    @sale = sales.where(status: 'basket').first
  end

  def sales_chilli_params
    params.require(:sale_chilli).permit(:quantity, :price_cents)
  end

  def update_sale_price(basket)
    basket.update(price_cents: basket.sales_chillis.all.map(&:price_cents).reduce(:+))
  end
end
