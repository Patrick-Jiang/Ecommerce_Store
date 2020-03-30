class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :stree
      t.string :city
      t.string :post_code
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
