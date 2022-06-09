class Sale < ApplicationRecord
  belongs_to :user

  has_many :sales_chillis
  has_many :chillis, through: :sales_chillis
end
