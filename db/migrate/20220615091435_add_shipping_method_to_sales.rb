class AddShippingMethodToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :shipping_method, :string, default: 'standard'
  end
end
