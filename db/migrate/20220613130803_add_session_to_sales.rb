class AddSessionToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :checkout_session_id, :string
  end
end
