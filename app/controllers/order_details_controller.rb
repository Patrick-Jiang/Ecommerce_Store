# frozen_string_literal: true

class OrderDetailsController < ApplicationController
  def create
    @order = current_order
    @order_detail = @order.order_details.new(order_params)
    @order.save
    session[:order_id] = @order.id

    redirect_to root_path
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update_attributes(order_params)
    @order_details = current_order.order_details

    redirect_to carts_path
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order_details = current_order.order_details

    redirect_to carts_path
  end

  private

  def order_params
    params.require(:order_detail).permit(:product_id, :quantity)
  end
end
