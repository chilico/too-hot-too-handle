class SalesController < ApplicationController
  before_action :set_basket, only: %i[show update]

  def index
    @sales = Sale.where(user: current_user)
  end

  def show
  end

  def update
    @sale.update(status: 'pending')
    Sale.create(user: current_user, sale_sku: "user_sale_#{current_user.sales.count + 1}")

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @sale.sale_sku,
        images: [@sale.chillis.each { |i| i.photos.first }],
        amount: @sale.price_cents,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: order_confirmation_url(@sale),
      cancel_url: sale_url(@sale)
    )

    @sale.update(checkout_session_id: session.id)
    redirect_to new_sale_payment_path(@sale), status: :see_other

    # @sale.update(status: 'confirmed')
    # redirect_to order_confirmation_path(@sale), status: :see_other
  end

  def confirm
    sales = Sale.where(user: current_user)
    @sale = sales.where(status: 'confirmed').last
  end

  private

  def set_basket
    sales = Sale.where(user: current_user)
    @sale = sales.where(status: 'basket').first
  end
end
