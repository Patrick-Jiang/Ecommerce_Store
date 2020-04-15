# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  before_save :set_subtotal
  before_save :set_total

  def subtotal
    order_details.collect { |order_detail| order_detail.valid? ? order_detail.unit_price * order_detail.quantity : 0 }.sum
  end

  def total
    subtotal.to_s.to_d + order_gst.to_s.to_d + order_pst.to_s.to_d + order_hst.to_s.to_d
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_total
    self[:total] = total
  end
end
