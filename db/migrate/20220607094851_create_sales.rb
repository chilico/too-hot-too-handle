class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.string :status
      t.string :shipping_method
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
