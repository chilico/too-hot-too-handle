class RemoveShippingFromSales < ActiveRecord::Migration[7.0]
  def change
    remove_column :sales, :shipping_method
  end
end
