class Chilli < ApplicationRecord
  include AlgoliaSearch
  belongs_to :user
  has_many :sale_chillis
  has_many :flags
  has_many_attached :photos
  monetize :price_cents

  algoliasearch do
    # all attributes will be sent
    attributes :variety, :chilli_type, :species, :heat, :description

    searchableAttributes ['unordered(chilli_type)', 'unordered(heat)', 'unordered(species)', 'unordered(variety)']
  end
end
