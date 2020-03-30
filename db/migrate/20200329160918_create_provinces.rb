class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :GST_rate
      t.integer :PST_rate
      t.integer :HST_rate

      t.timestamps
    end
  end
end
