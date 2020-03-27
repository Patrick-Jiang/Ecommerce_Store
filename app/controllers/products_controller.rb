# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end

  def search
    @products = if params[:category_id].blank?
                  Product.where('name LIKE ?',
                                "%#{params[:search_term]}%")
                else
                  Product.where('name LIKE ? AND category_id = ?',
                                "%#{params[:search_term]}%",
                                params[:category_id].to_s)
                end

    @products
  end
end
