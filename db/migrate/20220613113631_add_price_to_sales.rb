class AddPriceToSales < ActiveRecord::Migration[7.0]
  def change
    add_monetize :sales, :price, currency: { present: false }
  end
end
