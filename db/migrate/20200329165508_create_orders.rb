# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :orderPrice
      t.float :subTotal
      t.float :GST
      t.float :PST
      t.float :HST


      t.timestamps
    end
  end
end
