# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @order_details = current_order.order_details
    @user = User.find(current_order.user_id)
    @Province = Province.find(@user.province_id)
  end
end
