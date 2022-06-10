class SalesController < ApplicationController
  before_action :set_basket, only: %i[show update]

  def show
  end

  def update
    @sale.update(status: 'confirmed')
    new_sale = Sale.create(user: current_user)
    redirect_to update_basket_path(new_sale)
    # redirect_to order_confirmation_path(@sale)
  end

  def confirm
  end

  private

  def set_basket
    sales = Sale.where(user: current_user)
    @sale = sales.where.not(status: 'complete').first
  end
end
