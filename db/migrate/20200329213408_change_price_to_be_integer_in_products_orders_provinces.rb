# frozen_string_literal: true

class ChangePriceToBeIntegerInProductsOrdersProvinces < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :integer
    change_column :orders, :orderPrice, :integer
    change_column :orders, :subTotal, :integer
    change_column :orders, :GST, :integer
    change_column :orders, :PST, :integer
    change_column :orders, :HST, :integer
    change_column :provinces, :GST_rate, :integer
    change_column :provinces, :PST_rate, :integer
    change_column :provinces, :HST_rate, :integer
  end
end
