class AddUnitToChillis < ActiveRecord::Migration[7.0]
  def change
    add_column :chillis, :unit, :string
  end
end
