# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    # products = Product.find(session[:cart])

    # province = current_user.province

    # order = Order.create!(
    #   order_status: 'Pending',
    #   order_pst: province.pst_rate,
    #   order_gst: province.gst_rate,
    #   order_hst: province.hst_rate,
    #   user_id: current_user.id
    # )

    # products.each do |product|
    #   OrderDetail.create!(
    #     quantity: 1,
    #     unit_price: product.price.to_i,
    #     order_id: order.id,
    #     product_id: product.id
    #   )
    # end
  end
end
