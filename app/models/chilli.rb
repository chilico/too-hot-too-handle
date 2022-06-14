class Chilli < ApplicationRecord
  include AlgoliaSearch
  belongs_to :user
  has_many :sale_chillis
  has_many :flags
  has_many :reviews
  has_many_attached :photos

  SPECIES = ["annuum", "baccatum", "chinense", "frutescens", "pubescens"]
  CHILLI_TYPE = ["dried", "seeds", "fresh"]
  HEAT = ["none", "mild", "medium", "hot", "extreme"]
  validates :species, inclusion: { in: SPECIES }
  validates :chilli_type, inclusion: { in: CHILLI_TYPE }
  validates :heat, inclusion: { in: HEAT }

  monetize :price_cents


  algoliasearch do
    # all attributes will be sent
    attributes :variety, :chilli_type, :species, :heat, :description

    searchableAttributes ['unordered(chilli_type)', 'unordered(heat)', 'unordered(species)', 'unordered(variety)']
  end
end
