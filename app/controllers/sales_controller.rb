class SalesController < ApplicationController
  before_action :set_basket, only: %i[show update]

  def index
    @sales = Sale.where(user: current_user).order(updated_at: :desc)
  end

  def show
  end

  def update
    price_with_shipping = @sale.price_cents
    price_with_shipping += @sale.shipping_method == 'standard' ? Sale::STANDARD : Sale::EXPRESS
    @sale.update(status: 'pending', price_cents: price_with_shipping)
    Sale.create(user: current_user, sale_sku: "user_sale_#{current_user.sales.count + 1}")

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Order No. #{@sale.sale_sku.split('_')[2]}",
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
  end

  def confirm
    @sale = Sale.find(params[:id])
  end

  private

  def set_basket
    sales = Sale.where(user: current_user)
    @sale = sales.where(status: 'basket').first
  end
end
