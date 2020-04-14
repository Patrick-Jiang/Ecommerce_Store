# frozen_string_literal: true

class AddTotalToOrderdetails < ActiveRecord::Migration[6.0]
  def change
    add_column :order_details, :total, :decimal
  end
end
