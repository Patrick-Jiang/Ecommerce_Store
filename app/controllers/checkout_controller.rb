# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    order = Order.find(params[:id])
    user = User.find(order.user_id)
    if order.nil?
      redirect_to carts_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: user.name,
          description: user.address,
          amount: (order.total * 100).to_i,
          currency: 'cad',
          quantity: 1
        },
        {
          name: 'PST',
          description: 'Manitoba Provincial Sales Tax',
          amount: (order.order_pst * 100).to_i,
          currency: 'cad',
          quantity: 1
        },
        {
          name: 'GST',
          description: 'Federal Goods and Services Tax',
          amount: (order.order_gst * 100).to_i,
          currency: 'cad',
          quantity: 1
        }
      ],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @order = current_order
    @order.order_status = 'Paid'
    @order.save
  end
end
