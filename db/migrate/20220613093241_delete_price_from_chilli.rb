class DeletePriceFromChilli < ActiveRecord::Migration[7.0]
  def change
    remove_column :chillis, :price
  end
end
