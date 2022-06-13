class AddPriceToChillis < ActiveRecord::Migration[7.0]
  def change
    add_monetize :chillis, :price, currency: { present: false }
  end
end
