class Chilli < ApplicationRecord
  belongs_to :user
  has_many :sale_chillis
  has_many :flags
  has_many :reviews
  has_many_attached :photos
  SPECIES = ["annum", "baccatum", "chinense", "frutescens", "pubescens"]
  CHILLI_TYPE = ["dried", "seeds", "fresh"]
  HEAT = ["none", "mild", "medium", "hot", "extreme"]
  validates :species, inclusion: { in: SPECIES }
  validates :chilli_type, inclusion: { in: CHILLI_TYPE }
  validates :heat, inclusion: { in: HEAT }

  include AlgoliaSearch

  algoliasearch do
    # all attributes will be sent
    attributes :variety, :chilli_type, :species, :description, :heat

    searchableAttributes ['chilli_type', 'species', 'heat', 'variety']
  end
end
