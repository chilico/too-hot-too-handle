class AddSaleSkuToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :sale_sku, :string
  end
end
