# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

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

  def add_to_cart
    id = params[:id].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
      redirect_to products_path
    end
  end



  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to products_path
  end



  private

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
