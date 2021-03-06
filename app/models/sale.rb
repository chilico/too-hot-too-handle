class Sale < ApplicationRecord
  STANDARD = 300
  EXPRESS = 800

  belongs_to :user

  has_many :sales_chillis, dependent: :destroy
  has_many :chillis, through: :sales_chillis

  monetize :price_cents
end
