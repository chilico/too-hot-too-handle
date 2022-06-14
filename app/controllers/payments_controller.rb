class PaymentsController < ApplicationController
  def new
    @sale = current_user.sales.where(status: 'pending').find(params[:sale_id])
  end
end
