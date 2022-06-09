class SalesController < ApplicationController
  before_action :set_basket, only: %i[show]

  def show
  end

  private

  def set_basket
    sales = Sale.where(user: current_user)
    @sale = sales.where.not(status: 'complete').first
  end
end
