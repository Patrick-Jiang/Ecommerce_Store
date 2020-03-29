# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders

  belongs_to :user
end