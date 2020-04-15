# frozen_string_literal: true

module ApplicationHelper
  def current_order
    if current_user
      if !session[:order_id].nil?
        Order.find(session[:order_id])
      else
        Order.new(user_id: current_user.id)

      end
    end
  end
end
