class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :pwd
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
