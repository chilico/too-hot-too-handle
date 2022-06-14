class AddPriceToSalesChillis < ActiveRecord::Migration[7.0]
  def change
    add_monetize :sales_chillis, :price, currency: { present: false }
  end
end
