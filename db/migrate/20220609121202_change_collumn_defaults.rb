class ChangeCollumnDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column_default :sales_chillis, :quantity, from: nil, to: 1
    change_column_default :sales, :status, from: nil, to: 'basket'
  end
end
