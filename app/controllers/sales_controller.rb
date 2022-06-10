class SalesController < ApplicationController
  before_action :set_basket, only: %i[show update]

  def show
  end

  def update
    @sale.update(status: 'confirmed')
    Sale.create(user: current_user)
    redirect_to order_confirmation_path(@sale), status: :see_other
  end

  def confirm
  end

  private

  def set_basket
    sales = Sale.where(user: current_user)
    @sale = sales.where.not(status: 'confirmed').first
  end
end
