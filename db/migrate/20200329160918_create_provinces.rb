class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.float :GST_rate
      t.float :PST_rate
      t.float :HST_rate

      t.timestamps
    end
  end
end
