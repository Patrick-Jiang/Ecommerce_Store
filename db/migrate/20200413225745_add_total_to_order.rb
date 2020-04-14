# frozen_string_literal: true

class AddTotalToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total, :decimal
    add_column :orders, :subtotal, :decimal
  end
end
