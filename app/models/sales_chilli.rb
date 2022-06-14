class SalesChilli < ApplicationRecord
  belongs_to :sale
  belongs_to :chilli

  monetize :price_cents
end
