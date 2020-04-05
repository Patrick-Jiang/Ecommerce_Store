# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    items = Product.find(session[:cart])
    subtoal = 0
    order = Order.create(user_id: current_user.id)
    items.each do |item|
      subtoal += item.price.to_i
      ProductOrder.create(order_id: order.id,
                          product_id: item.id)
    end
    order.subTotal = subtoal
    redirect_to
  end

  def cancel; end

  def success; end
end
