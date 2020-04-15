# frozen_string_literal: true

class OrderDetailsController < ApplicationController
  def create
    @order = current_order
    @order.order_status = 'Pending'
    @user = User.find(current_order.user_id)
    @Province = Province.find(@user.province_id)

    @order_detail = @order.order_details.new(order_params)
    if @Province.hst_rate.nil?
      @order.order_gst = (@Province.gst_rate * @order.subtotal) / 100
      @order.order_pst = (@Province.pst_rate * @order.subtotal) / 100
    else
      @order.order_hst = (@Province.gst_rate * @order.subtotal) / 100
    end

    # @order.total = @order.subtotal + @order.order_gst + @order.order_pst + @order.order_hst
    @order.save
    session[:order_id] = @order.id

    redirect_to root_path
  end

  def update
    @order = current_order
    @user = User.find(current_order.user_id)
    @Province = Province.find(@user.province_id)

    @order_detail = @order.order_details.find(params[:id])

    @order_detail.update_attributes(order_params)
    if @Province.hst_rate.present?
      @order.order_hst = (@Province.hst_rate * @order.subtotal) / 100
    else
      @order.order_gst = (@Province.gst_rate * @order.subtotal) / 100
      @order.order_pst = (@Province.pst_rate * @order.subtotal) / 100

    end
    @order_details = current_order.order_details

    @order.save
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
