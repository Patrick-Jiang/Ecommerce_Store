class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :order_gst
      t.decimal :order_pst
      t.decimal :order_hst
      t.string :order_status

      t.timestamps
    end
  end
end
