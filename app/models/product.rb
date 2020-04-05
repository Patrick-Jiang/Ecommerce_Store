# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  has_many :order_details
  has_many :orders, through: :order_details

  has_many :product_tags
  has_many :tags, through: :product_tags
  accepts_nested_attributes_for :product_tags, allow_destroy: true
  validates :name, presence: true

  has_one_attached :attachedimage
end
