class CreateChillis < ActiveRecord::Migration[7.0]
  def change
    create_table :chillis do |t|
      t.string :variety
      t.string :heat
      t.integer :quantity
      t.text :description
      t.string :species
      t.string :chilli_type
      t.date :date_available
      t.float :price
      t.integer :shu
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
