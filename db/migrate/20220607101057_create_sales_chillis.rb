class CreateSalesChillis < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_chillis do |t|
      t.integer :quantity
      t.references :sale, null: false, foreign_key: true
      t.references :chilli, null: false, foreign_key: true

      t.timestamps
    end
  end
end
