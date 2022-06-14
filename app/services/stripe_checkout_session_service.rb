class StripeCheckoutSessionService
  def call(event)
    sale = Sale.find_by(checkout_session_id: event.data.object.id)
    sale.update(status: 'confirmed')
  end
end
